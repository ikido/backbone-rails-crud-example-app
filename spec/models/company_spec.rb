# encoding: utf-8

require 'spec_helper'

describe Company do
  
  it "is valid with valid attributes" do
    FactoryGirl.build(:company, name: "Test company").should be_valid
  end
  
  it "is not valid with blank name" do
    FactoryGirl.build(:company, name: nil).should_not be_valid
  end
  
end