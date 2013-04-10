FactoryGirl.define do
  factory :page do |f|
    association :category
    f.sequence(:title){ |n| "title#{n}"}
  end
end
