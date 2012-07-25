# encoding: utf-8
class Company < ActiveRecord::Base
  attr_accessible :address, :name, :phone
end
