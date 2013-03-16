class Event < ActiveRecord::Base
  include Addresseable

  default_scope { order("date DESC") }

  attr_accessible :city, :date, :description, :postal_code, :street, :title,
                  :website

  belongs_to :user

  validates :title,       presence: true
  validates :date,        presence: true
  validates :description, presence: true
  validates :postal_code, presence: true
  validates :street,      presence: true
  validates :city,        presence: true
  validates :user,        presence: true

  def to_s
    title
  end
end
