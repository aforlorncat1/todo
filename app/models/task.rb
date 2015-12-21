require 'byebug'
class Task < ActiveRecord::Base

	def self.list
		@list = Task.all
		i = 0
		until i == @list.length
			puts "#{i+1}. #{@list[i].description} #{@list[i].status}"
			i += 1
		end

		# @list.each do |x|
		# 	if x.status == 1 && x.description.include?("Done")
		# 		x.description << "    [Done]"
		# 		x.save!
		# 	elsif x.status == 1
		# 		next
				# x.description << "    [Done]"
				# x.save!
		# 	end
		# end
	end

	def self.add(task)
		Task.create!(description:task.join(" "), status:0)
		self.reset_id
		puts "Appended '#{task.join(" ")}' to your Todo list"
	end

	def self.delete(id)
		to_delete = Task.find_by(id:id-1)
		to_delete.destroy
		self.reset_id
		puts "Deleted '#{to_delete.description}' from your Todo list"
	end

	def self.complete(id)
		to_complete = Task.all.find_by(id:id)
		to_complete.status = 1
		to_complete.save!
		# if to_complete.status == 1
		# 	to_complete.description + "    [Done]
	end

	def self.reset_id
		i=0
		self.find_each do |x|
			x.status(id:i)
			x.save!
			i+=1
		end
	end

end
