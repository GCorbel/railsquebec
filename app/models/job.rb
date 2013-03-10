class Job < ActiveRecord::Base
  include Addresseable

  attr_accessible :street, :city, :company_name, :description, :email,
                  :postal_code, :post_name, :website

  validates :company_name, presence: true
  validates :email, presence: true
  validates :post_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :description, presence: true
end
