require 'spec_helper'

describe Person do
	it "requires a full name" do
		person = Person.new
		person.valid?.should == false
	end
end