class Job < ActiveRecord::Base
  include Addresseable

  attr_accessible :address, :city, :company_name, :description, :email,
                  :postal_code, :post_name, :website

  validates :company_name, presence: true
  validates :email, presence: true
  validates :post_name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
end
