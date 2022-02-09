# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name { Faker::Food.unique.ethnic_category }
  end

  factory :menu_item do
    category
    name { Faker::Food.unique.dish }
    price { Faker::Number.between(from: 500, to: 10_000) }
    description { Faker::Food.description }
  end

  tables = %w[Table1 Table2 Table3 Table4 Table5 Table6 TakeAway]

  factory :order do
    table { tables.sample }
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end

  factory :order_item do
    menu_item
    order
    quantity { Faker::Number.between(from: 1, to: 8) }
    request { Faker::Adjective.unique.positive }
  end

  factory :menu_group do
    name { Faker::Dessert.unique.variety }
  end

  factory :group_menu_item do
    menu_group
    menu_item
    variant_name { Faker::Dessert.unique.flavor }
  end

  factory :permission do
    name { Faker::Hacker.unique.ingverb }
  end

  factory :role do
    name { Faker::Job.unique.position }
  end

  factory :permission_role do
    role
    permission
  end

  factory :customer

  factory :employee do
    role
  end

  password = Faker::Internet.password(min_length: 8)
  factory :user do
    email { Faker::Internet.unique.email }
    password { password }
    password_confirmation { password }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    trait :for_customer do
      association :userable, factory: :customer
    end
    trait :for_employee do
      association :userable, factory: :employee
    end
  end
end
