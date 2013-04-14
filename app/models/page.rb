class Page < MinimalistCms::Page
  belongs_to :category

  attr_accessible :position

  default_scope order(:position)
end
