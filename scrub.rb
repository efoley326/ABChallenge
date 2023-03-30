require 'json'

file = ARGF.read
data_file = JSON.parse(file)
puts data_file
