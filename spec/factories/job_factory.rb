FactoryGirl.define do
  factory :job do |f|
    company_name  "Company Name"
    email         "Comp@domain.com"
    website       "http://domain.com"
    post_name     "Developer"
    address       "43 rue de la boustifaille"
    city          "Montreal"
    postal_code   "A1B2C3"
    description   "A Long Description"
  end
end
