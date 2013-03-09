class Event < ActiveRecord::Base
  include Addresseable

  attr_accessible :city, :date, :description, :postal_code, :street, :title,
                  :website

  validates :title,       presence: true
  validates :date,        presence: true
  validates :description, presence: true
  validates :postal_code, presence: true
  validates :street,      presence: true
  validates :city,        presence: true
end
