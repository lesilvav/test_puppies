require 'faker'
require_relative 'puppy'

FactoryGirl.define do

  factory :puppy do
    name { Faker::Name.name }
    breed { Faker::Pokemon.name }
    gender 'female'
    description { Faker::ChuckNorris.fact }
    image_url { Faker::Avatar.image }
    fees { Faker::Number.decimal(2) }
  end

  factory :order do
    name 'Cheezy'
    address '123 Main'
    email 'my_email@email.com'
    pay_type 'Check'
  end

  factory :adoption do
    association :order
    association :puppy
  end
end




