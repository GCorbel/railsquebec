class Job < ActiveRecord::Base
  attr_accessible :address, :city, :company_name, :description, :email,
                  :postal_code, :post_name, :website
end
