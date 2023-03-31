require 'json'

# return txt file as an array
sensitive_fields = File.open('sensitive_fields.txt', 'r').flat_map {
  |field| field.split(' ') 
}
puts sensitive_fields

# sort filenames to return only json files
ARGV.each_with_index.map { |filename, index| 
  unless filename.include?('.json')
    ARGV.delete_at(index)
  end
}

# parse json
json_file = ARGF.read
json_data = JSON.parse(json_file)
puts json_data

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
puts scrubbed_data

# write scrubbed data to new json file
new_file = File.new('scrubbed_data.json', 'w')
new_file.syswrite(JSON.pretty_generate(scrubbed_data))
new_file.close
