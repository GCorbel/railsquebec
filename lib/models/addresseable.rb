module Addresseable
  extend ActiveSupport::Concern

  included do
    geocoded_by :address
    after_validation :geocode
  end

  def address
    [street, postal_code, city].join(', ')
  end
end
