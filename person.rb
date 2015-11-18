require "date"
class Person
	attr_accessor :dob, :first_name, :surname
	attr_reader  :emails, :phone_numbers
	def initialize(fname, sname, dob)
		@dob = Date.parse(dob)
		@first_name = fname.capitalize
		@surname = sname.capitalize
		@emails = []
		@phone_numbers = []

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

	def add_phone_numbers(insert)
    phone_numbers.push(insert)
  	end

  	def remove_phone_numbers(remove)
  	phone_numbers.delete_at(remove)
  	end

  	def to_s()
    "#{first_name} #{surname} was born on #{dob}.\nTheir email addresses are: #{emails}.\n Their phone numbers are #{phone_numbers}"
  	end
end

