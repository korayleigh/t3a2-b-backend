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

unless MenuGroup.any?
  menu_groups = %w[Milkshakes]
  menu_groups.each do |menu_group|
    MenuGroup.create(name: menu_group)
    puts "created Menu Group: #{menu_group}"
  end
end

unless MenuItem.any?
  entree_category = Category.find_by!(name: 'Entrees')
  MenuItem.create!(name: 'Papas Fritas', price: 1200,
                   description: 'Crispy fried potatoes, salsa roja, maggi aioli',
                   category: entree_category)
  puts 'created MenuItem: Papas Fritas'
  MenuItem.create!(name: 'Chilaquiles', price: 900,
                   description: 'Tortilla chips, salsa roja, house mix cheeses, crema',
                   category: entree_category)
  puts 'created MenuItem: Chilaquiles'
  MenuItem.create!(name: 'Guacamole', price: 950,
                   description: 'Crushed avocado, tomato, onion, chile, coriander and lime juice',
                   category: entree_category)
  puts 'created MenuItem: Guacamole'

  tacos_category = Category.find_by!(name: 'Tacos')
  MenuItem.create!(name: 'Al Pastor', price: 600,
                   description: 'Free-range spiced pork, achiote, guajillo chile, pineapple-habanero sala',
                   category: tacos_category)
  puts 'created MenuItem: Al Pastor'
  MenuItem.create!(name: 'Carne Asada', price: 600,
                   description: 'Marinated grilled beef, fresh-herb salsa',
                   category: tacos_category)
  puts 'created MenuItem: Carne Asada'
  MenuItem.create!(name: 'Pescado', price: 650,
                   description: 'Corn battered fish, jalapeño mayo, coleslaw salad, pico de gallo',
                   category: tacos_category)
  puts 'created MenuItem: Pescado'
  MenuItem.create!(name: 'Tinga de Pollo', price: 600,
                   description: 'Free-range chicken, chipotle-tomato salsa, black beans',
                   category: tacos_category)
  puts 'created MenuItem: Tinga de Pollo'

  main_category = Category.find_by!(name: 'Mains')
  MenuItem.create!(name: 'Carnitas', price: 4000,
                   description: 'Wood roasted pork belly, hibiscus and plum chamoy',
                   category: main_category)
  puts 'created MenuItem: Carnitas'
  MenuItem.create!(name: 'Pescado a ala parrilla', price: 2400,
                   description: 'Whole grilled flathead, ajo blanco, pistacchio crumb',
                   category: main_category)
  puts 'created MenuItem: Beef Burger'

  postres_category = Category.find_by!(name: 'Postres')
  MenuItem.create!(name: 'Churros', price: 1200,
                   description: 'Churros with bourbon caramel',
                   category: postres_category)
  puts 'created MenuItem: Churros'
  MenuItem.create!(name: 'Flan', price: 1000,
                   description: 'Flan de naranja tradicional',
                   category: postres_category)
  puts 'created MenuItem: Flan'
  MenuItem.create!(name: 'Pastel de elote', price: 1000,
                   description: 'Corn cake with dulce de leche atole',
                   category: postres_category)
  puts 'created MenuItem: Pastel de elote'

  drinks_category = Category.find_by!(name: 'Drinks')
  milkshakes_group = MenuGroup.find_by!(name: 'Milkshakes')

  GroupMenuItem.create!(
    menu_group: milkshakes_group,
    menu_item: MenuItem.create!(
      name: 'Chocolate Milkshake', price: 900,
      description: "It's a chocolate milkshake", category: drinks_category
    ),
    variant_name: 'Chocolate'
  )
  puts 'created MenuItem: Chocolate Milkshake'

  GroupMenuItem.create!(
    menu_group: milkshakes_group,
    menu_item: MenuItem.create!(
      name: 'Strawberry Milkshake', price: 900,
      description: "It's a strawberry milkshake", category: drinks_category
    ),
    variant_name: 'Strawberry'
  )
  puts 'created MenuItem: Strawberry Milkshake'

  GroupMenuItem.create!(
    menu_group: milkshakes_group,
    menu_item: MenuItem.create!(
      name: 'Banana Milkshake', price: 900,
      description: "It's a banana milkshake", category: drinks_category
    ),
    variant_name: 'Banana'
  )
  puts 'created MenuItem: Banana Milkshake'

  GroupMenuItem.create!(
    menu_group: milkshakes_group,
    menu_item: MenuItem.create!(
      name: 'Caramel Milkshake', price: 900,
      description: "It's a caramel milkshake", category: drinks_category
    ),
    variant_name: 'Caramel'
  )
  puts 'created MenuItem: Caramel Milkshake'
end

unless Permission.any?
  Permission.create!(name: :read_users)
  Permission.create!(name: :write_users)
  Permission.create!(name: :read_orders)
  Permission.create!(name: :write_orders)
  Permission.create!(name: :read_menu)
  Permission.create!(name: :write_menu)
end

unless Role.any?
  # read_users_permission = Permission.find_by!(name: :read_users)
  write_users_permission = Permission.find_by!(name: :write_users)

  read_orders_permission = Permission.find_by!(name: :read_orders)
  write_orders_permission = Permission.find_by!(name: :write_orders)

  # read_menu_permission = Permission.find_by!(name: :read_menu)
  write_menu_permission = Permission.find_by!(name: :write_menu)

  admin_role = Role.create!(name: 'Admin')
  admin_role.permissions.push(write_users_permission, write_orders_permission, write_menu_permission)
  puts 'created Role: Admin'

  manager_role = Role.create!(name: 'Manager')
  manager_role.permissions.push(write_orders_permission, write_menu_permission)
  puts 'created Role: Manager'

  chef_role = Role.create!(name: 'Chef')
  chef_role.permissions.push(read_orders_permission)
  puts 'created Role: Chef'

  watier_role = Role.create!(name: 'Waiter')
  watier_role.permissions.push(read_orders_permission)
  puts 'created Role: Waiter'
end

unless User.any?

  admin_role = Role.find_by!(name: 'Admin')
  User.create!(userable: Employee.new(role: admin_role),
               first_name: 'Admin', last_name: 'User', email: 'admin@mexiqui.to',
               password: 'reallydifficultadminpassword', password_confirmation: 'reallydifficultadminpassword')
  puts 'created Admin User'

  manager_role = Role.find_by!(name: 'Manager')
  User.create!(userable: Employee.new(role: manager_role),
               first_name: 'Manager', last_name: 'User', email: 'manager@mexiqui.to',
               password: 'reallydifficultmanagerpassword', password_confirmation: 'reallydifficultmanagerpassword')
  puts 'created Manager User'

  chef_role = Role.find_by!(name: 'Chef')
  User.create!(userable: Employee.new(role: chef_role),
               first_name: 'Chef', last_name: 'User', email: 'chef@mexiqui.to',
               password: 'reallydifficultchefpassword', password_confirmation: 'reallydifficultchefpassword')
  puts 'created Manager Chef'

  waiter_role = Role.find_by!(name: 'Waiter')
  User.create!(userable: Employee.new(role: waiter_role),
               first_name: 'Waiter', last_name: 'User', email: 'waiter@mexiqui.to',
               password: 'reallydifficultwaiterpassword', password_confirmation: 'reallydifficultwaiterpassword')
  puts 'created Manager Waiter'

end

unless Order.any?
  first_order = Order.create!(table: 0, name: 'Bob', email: 'bob@test.com')
  puts 'created a new Order'

  papas_fritas_menu_item = MenuItem.find_by!(name: 'Papas Fritas')
  OrderItem.create!(order: first_order, menu_item: papas_fritas_menu_item, price_at_order: papas_fritas_menu_item.price)
  puts 'added Papas Fritas to this order'

  tinga_de_pollo_menu_item = MenuItem.find_by!(name: 'Tinga de Pollo')
  OrderItem.create!(order: first_order, menu_item: tinga_de_pollo_menu_item, price_at_order: tinga_de_pollo_menu_item.price)
  puts 'added Tinga de Pollo to this order'

  churros_menu_item = MenuItem.find_by!(name: 'Churros')
  OrderItem.create!(order: first_order, menu_item: churros_menu_item, price_at_order: churros_menu_item.price)
  puts 'added Churros to this order'
  first_order.save!

  first_order.update!(updated_by: User.employees.find_by(first_name: 'Manager'))
end
