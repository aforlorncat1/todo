#seeds runs the faker library to populate the list.
require 'faker'
require 'byebug'
require_relative '../app/models/task'

class Seed
	def self.populate
		6.times do
	 	sentences = Faker::Lorem.words(5).join(" ")
	 	Task.create!(description: sentences, status:0)
	 end
	end
end

Seed.populate

# puts @sentence_arr
