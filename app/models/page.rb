class Page < ActiveRecord::Base
  acts_as_page

  belongs_to :category

  attr_accessible :position

  default_scope order(:position)
end
