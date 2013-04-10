class Category < ActiveRecord::Base
  has_many :pages

  attr_accessible :position, :title

  default_scope order(:position)
end
