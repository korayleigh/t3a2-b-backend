# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Category.any?
  categories = %w[Entrees Tacos Mains Postres Drinks]
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
  MenuItem.create!(name: 'Papas fritas', price: 1200,
                   description: 'Crispy fried potatoes, salsa roja, maggi aioli',
                   category_id: entree_category_id)
  puts 'created MenuItem: Papas fritas'
  MenuItem.create!(name: 'Chilaquiles', price: 900,
                   description: 'Tortilla chips, salsa roja, house mix cheeses, crema',
                   category_id: entree_category_id)
  puts 'created MenuItem: Chilaquiles'
  MenuItem.create!(name: 'Guacamole', price: 950,
                   description: 'Crushed avocado, tomato, onion, chile, coriander and lime juice',
                   category_id: entree_category_id)
  puts 'created MenuItem: Guacamole'

  tacos_category_id = Category.find_by(name: 'Tacos').id
  MenuItem.create!(name: 'Al Pastor', price: 600,
                   description: 'Free-range spiced pork, achiote, guajillo chile, pineapple-habanero sala',
                   category_id: tacos_category_id)
  puts 'created MenuItem: Al Pastor'
  MenuItem.create!(name: 'Carne Asada', price: 600,
                   description: 'Marinated grilled beef, fresh-herb salsa',
                   category_id: tacos_category_id)
  puts 'created MenuItem: Carne Asada'
  MenuItem.create!(name: 'Pescado', price: 650,
                   description: 'Corn battered fish, jalapeño mayo, coleslaw salad, pico de gallo',
                   category_id: tacos_category_id)
  puts 'created MenuItem: Pescado'
  MenuItem.create!(name: 'Tinga de Pollo', price: 600,
                   description: 'Free-range chicken, chipotle-tomato salsa, black beans',
                   category_id: tacos_category_id)
  puts 'created MenuItem: Tinga de Pollo'

  main_category_id = Category.find_by(name: 'Mains').id
  MenuItem.create!(name: 'Carnitas', price: 4000,
                   description: 'Wood roasted pork belly, hibiscus and plum chamoy',
                   category_id: main_category_id)
  puts 'created MenuItem: Carnitas'
  MenuItem.create!(name: 'Pescado a ala parrilla', price: 2400,
                   description: 'Whole grilled flathead, ajo blanco, pistacchio crumb',
                   category_id: main_category_id)
  puts 'created MenuItem: Beef Burger'

  postres_category_id = Category.find_by(name: 'Postres').id
  MenuItem.create!(name: 'Churros', price: 1200,
                   description: 'Churros with bourbon caramel',
                   category_id: postres_category_id)
  puts 'created MenuItem: Churros'
  MenuItem.create!(name: 'Flan', price: 1000,
                   description: 'Flan de naranja tradicional',
                   category_id: postres_category_id)
  puts 'created MenuItem: Flan'
  MenuItem.create!(name: 'Pastel de elote', price: 1000,
                   description: 'Corn cake with dulce de leche atole',
                   category_id: postres_category_id)
  puts 'created MenuItem: Pastel de elote'

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
