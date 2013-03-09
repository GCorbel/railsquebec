class Event < ActiveRecord::Base
  attr_accessible :city, :date, :description, :postal_code, :street, :title, :website
end
