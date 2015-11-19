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

    def print_details ()
      "#{fullname}\n ---------- \n Date of Birth: #{@dob.strftime('%d %B %Y')} \n\n Email Addresses:\n - #{emails.join(" \n- ")} \n\n Phone Numbers:\n #{phone_numbers.join}"
    end

end

class FamilyMember < Person
  attr_accessor :relationship
  def initialize(*args, relationship)
    @relationship = relationship
    super(*args)
  end
end

class AddressBook
  def initialize
    @entries = []
  end
  def add(person)
    if person.is_s? Person
    @entries <<person
    else
    raise "Provide a valid name"
    end
  end

  def list
    puts "Address Book"
    puts "------------"
    @entries.each_with_index do |person,i|
    puts "Entry #{i+1}: #{person,fullname}"    
    end
  end
end

