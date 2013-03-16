class Job < ActiveRecord::Base
  include Addresseable

  default_scope { order("created_at DESC") }

  attr_accessible :street, :city, :company_name, :description, :email,
                  :postal_code, :post_name, :website

  belongs_to :user

  validates :company_name, presence: true
  validates :email, presence: true
  validates :post_name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :postal_code, presence: true
  validates :description, presence: true

  def to_s
    post_name
  end
end
