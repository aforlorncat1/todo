require 'byebug'

class Controller

	def self.run(input)
		input_check = input[0]
		case input_check
			when "add"
				Task.add(input[1..-1])
			when "delete"
				Task.delete(input[1].to_i)
			when "list"
				Task.list
			when "complete"
				Task.complete(input[1].to_i)
			else
				puts "Invalid argument"
			end
	end
end