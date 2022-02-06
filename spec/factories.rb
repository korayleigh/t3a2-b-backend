# frozen_string_literal: true

FactoryBot.define do
  category_array = %w[Entrees Tacos Mains Postres Drinks]

  factory :category_factory, class: Category do
    category { category_array.sample }
  end
end
