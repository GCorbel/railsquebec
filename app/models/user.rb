class User < ActiveRecord::Base
  include Addresseable

  default_scope { order("created_at DESC") }

  has_many :events

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :city, :email_visible, :github, :postal_code,
                  :street, :twitter, :username, :website

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :postal_code, presence: true

  def to_s
    username
  end
end
