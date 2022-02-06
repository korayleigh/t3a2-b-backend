# frozen_string_literal: true

FactoryBot.define do
  sequence :name do |n|
    "#{Faker::Food.ethnic_category}#{n}"
  end

  factory :category do
    name { generate :name }
  end
end
