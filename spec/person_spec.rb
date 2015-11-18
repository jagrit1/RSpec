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

    expect (person.emails).to eq []

    expect (person.add_email).to eq "joe@foo.com"
    expect (person.add_email).to eq "joe.bloggs@work.com" 

    expect (person.emails).to eq  ["joe@foo.com", "joe.bloggs@work.com"] 


    expect (person.remove_email(0)).to eq  ["joe.bloggs@work.com"]
  end
end


