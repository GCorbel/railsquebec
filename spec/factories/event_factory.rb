FactoryGirl.define do
  factory :event do |f|
    title         "Title"
    date          Time.now
    website       "http://domain.com"
    street        "43 rue de la boustifaille"
    city          "Montreal"
    postal_code   "A1B2C3"
    description   "A Long Description"
  end
end
