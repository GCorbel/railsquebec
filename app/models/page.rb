class Page < ActiveRecord::Base
  acts_as_page
  translates :title, :slug, :meta_keywords, :meta_description

  belongs_to :category

  attr_accessible :position
end
