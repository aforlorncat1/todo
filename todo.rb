require_relative 'config/application'
require_relative 'app/controllers/controller'
require_relative 'app/models/task'

puts "Put your application code in #{File.expand_path(__FILE__)}"

# puts "List of commands: add, delete, complete, list"
input = ARGV
Controller.run(input)

