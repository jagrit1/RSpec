require "date"
class Person
	attr_accessor :dob, :first_name, :surname, :emails
	def initialize(fname, sname, dob)
		@dob = Date.parse(dob)
		@first_name = fname.capitalize
		@surname = sname.capitalize
		@emails = Array.new

	end
	def fullname
		"#{first_name} #{surname}" 
	end

	def add_email(insert)
    emails.push(insert)
  	end

  	def remove_email (remove)
  	emails.delete_at(remove)
  	end
end

