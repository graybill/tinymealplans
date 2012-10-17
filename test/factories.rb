require 'factory_girl'

FactoryGirl.define do

  sequence :name do |n|
    "awesomefood#{n}"
  end
  factory :food do
    name
  end
 
  factory :meal do
    name "Lunch"
    date "2012-10-01 00:00:00"
  end

  factory :user do
    handle "machoman"
    email "foo@dude.com"
  end

end
