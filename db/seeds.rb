# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Category.any?
  categories = %w[Entrees Mains Desserts Drinks]
  categories.each do |category|
    Category.create(name: category)
    puts "created Category: #{category}"
  end
end

unless Group.any?
  groups = %w[Milkshakes]
  groups.each do |group|
    Group.create(name: group)
    puts "created Group: #{group}"
  end
end

unless MenuItem.any?
  entree_category_id = Category.find_by(name: 'Entrees').id
  MenuItem.create!(name: 'Bruschetta', price: 1600,
                   description: 'Toasted sourdough brushed with olive oil and topped with our mix of chopped tomato, red onion and basil',
                   category_id: entree_category_id)
  MenuItem.create!(name: 'Calamari', price: 1900,
                   description: 'Lightly battered fresh caught calamari topped with sea salt',
                   category_id: entree_category_id)

  main_category_id = Category.find_by(name: 'Mains').id
  MenuItem.create!(name: 'Chicken Parmagiana', price: 2900,
                   description: 'Crumbed chicken schnitzel topped with ham, tomato sauce and cheese, served with a side of fries',
                   category_id: main_category_id)
  puts 'created MenuItem: Chicken Parmagiana'
  MenuItem.create!(name: 'Beef Burger', price: 2400,
                   description: 'Home made Australian farmed and grass-fed beef patty towered with cheese, tomato sauce, mustard, lettuce, tomato, red onion and pickle',
                   category_id: main_category_id)
  puts 'created MenuItem: Beef Burger'

  drinks_category_id = Category.find_by!(name: 'Drinks').id
  milkshakes_group_id = Group.find_by!(name: 'Milkshakes').id

  MenuItem.create!(name: 'Chocolate Milkshake', price: 900, description: "It's a chocolate milkshake",
                   category_id: drinks_category_id, group_id: milkshakes_group_id)
  puts 'created MenuItem: Chocolate Milkshake'
  MenuItem.create!(name: 'Strawberry Milkshake', price: 900, description: "It's a strawberry milkshake",
                   category_id: drinks_category_id, group_id: milkshakes_group_id)
  puts 'created MenuItem: Strawberry Milkshake'
  MenuItem.create!(name: 'Banana Milkshake', price: 900, description: "It's a banana milkshake",
                   category_id: drinks_category_id, group_id: milkshakes_group_id)
  puts 'created MenuItem: Banana Milkshake'
  MenuItem.create!(name: 'Caramel Milkshake', price: 900, description: "It's a caramel milkshake",
                   category_id: drinks_category_id, group_id: milkshakes_group_id)
  puts 'created MenuItem: Caramel Milkshake'
end

unless User.any?
  User.create!(userable: Employee.new, first_name: 'Admin', last_name: 'User', email: 'admin@mexiqui.to',
               password: 'reallydifficultadminpassword', password_confirmation: 'reallydifficultadminpassword')
  puts 'created Admin User'
end
