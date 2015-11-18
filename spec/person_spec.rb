require 'spec_helper'

describe "Person Class - entries in phonebook" do 
	it "should store and return personal information" do
		person = Person.new("joe", "bloggs", "01,01/1990")

		expect(person.dob.class).to be Date
    expect(person.dob.to_s).to eq "1990-01-01"
		expect(person.first_name).to eq "Joe"
		expect(person.surname).to eq "Bloggs"
    expect(person.fullname).to eq "Joe Bloggs"
	end

  it "should store and return email addresses" do
    person = Person.new("joe", "bloggs", "01,01/1990")
    expect(person.emails).to eq []

    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"    
   
    expect(person.emails).to eq  ["joe@foo.com", "joe.bloggs@work.com"]
    expect(person.remove_email(0))
    expect(person.emails).to eq  ["joe.bloggs@work.com"]

  end
  it "should store and return phone numbers" do
    person = Person.new("joe", "bloggs", "01,01/1990")
    expect(person.phone_numbers).to eq []

    person.add_phone_numbers "07712345678"
    person.add_phone_numbers "02012345678"    
   
    expect(person.phone_numbers).to eq  ["07712345678", "02012345678"]
    expect(person.remove_phone_numbers(0))
    expect(person.phone_numbers).to eq  ["02012345678"]
  
  end
  it "should display the user information along with dob, email and phone" do
    person = Person.new("joe", "bloggs", "01,01/1990")
    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"
    person.add_phone_numbers "07712345678"
    person.add_phone_numbers "02012345678"

    expect(person.to_s).to eq "Joe Bloggs was born on 1990-01-01.\n Their email addresses are: [\"joe@foo.com\"].\n Their phone numbers are [\"07712345678\", \"02012345678\"]"
  end
end
 


 