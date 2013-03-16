module Addresseable
  extend ActiveSupport::Concern

  included do
    geocoded_by :address
  end

  def address
    [street, postal_code, city].join(', ')
  end
end
