require 'json'

# return txt file as an array
field_list = ARGV.find { |filename| 
  filename.include?('.txt') }
sensitive_fields = File.open(field_list, 'r').flat_map {
  |field| field.split(' ')
}

# sort filenames to return only json files
ARGV.each_with_index.map { |filename, index| 
  unless filename.include?('.json')
    ARGV.delete_at(index)
  end
}

# parse json
json_file = ARGF.read
json_data = JSON.parse(json_file)

# match json keys to sensitive fields && scrub fields' values
scrubbed_data =
  json_data.each do |k, v|
    sensitive_fields.each do |field|
      if field == k.to_s
        v.sub!('true', '-')
        v.sub!('false', '-')
        v.to_s.gsub!(/\w/, '*')
      end
    end
  end

# write scrubbed data to new or existing json file
pretty_data = JSON.pretty_generate(scrubbed_data)
if File.exists?('scrubbed_data.json')
  File.open('scrubbed_data.json', 'a') do |f|
    f.puts pretty_data
  end
else
  new_file = File.new('scrubbed_data.json', 'w')
  new_file.syswrite(pretty_data)
  new_file.close
end
