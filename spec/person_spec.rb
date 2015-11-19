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

    expect(person.to_s).to eq "Joe Bloggs was born on 1990-01-01.\nTheir email addresses are: [\"joe@foo.com\", \"joe.bloggs@work.com\"].\n Their phone numbers are [\"07712345678\", \"02012345678\"]"
  end

  it "Add a print_details method that prints out the details of the person, and then lists their emails and phone numbers on separate lines:" do
    person = Person.new("joe", "bloggs", "01,01/1990")
    person.add_email "joe@foo.com"
    person.add_email "joe.bloggs@work.com"
    person.add_phone_numbers "02012345678"
    expect(person.print_details).to eq "Joe Bloggs\n ---------- \n Date of Birth: 01 January 1990 \n\n Email Addresses:\n - joe@foo.com \n- joe.bloggs@work.com \n\n Phone Numbers:\n 02012345678"
   end
  end

  describe "FamilyMember class that inherits from Person " do 
   it "Add a FamilyMember that has an additional relationship instance variable and inherits from Person." do
      familymember = FamilyMember.new("Jag", "bloggs", "01,01/1990","brother")
      expect(familymember.dob.class).to be Date
      expect(familymember.dob.to_s).to eq "1990-01-01"
      expect(familymember.first_name).to eq "Jag"
      expect(familymember.surname).to eq "Bloggs"
      expect(familymember.relationship).to eq "brother"
   end
  end

  describe " an AddressBook class entries in AddressBook " do 
   it "create AddressBook with couple of entries for person" do
      person1 = Person.new("joe", "blogs", "1 Jan 1990")
      person2 = Person.new("andy", "nother", "2 Jan 1995")
      book = AddressBook.new
      book.add person1
      book.add person2
      expect(book.list).to eq "Address Book ------------ \nEntry 1: Joe Bloggs\nEntry 2: Andy Nother"
   end
  end












 


 