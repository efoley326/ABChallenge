require 'json'

# return txt file as an array
sensitive_fields = File.open('sensitive_fields.txt', 'r').flat_map {
  |field| field.split(' ') 
}
puts sensitive_fields
# sort filenames to return only json files


# parse json


# match json keys to sensitive fields && scrub fields' values


# write scrubbed data to new json file
