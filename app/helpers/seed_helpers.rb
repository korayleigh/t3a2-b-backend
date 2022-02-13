# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/ClassLength

class SeedHelpers
  def initialize
    @environment = Rails.env
  end

  def seed
    case @environment
    when 'test'
      seed_test
    when 'development'
      seed_development
    else
      seed_production

    end
  end

  def seed_test
    seed_categories
    seed_menu_groups
    seed_menu_items
    seed_permissions
    seed_roles
    seed_users
    seed_orders
    attach_images
  end

  def seed_development
    seed_categories
    seed_menu_groups
    seed_menu_items
    seed_permissions
    seed_roles
    seed_users
    seed_orders
    attach_images
  end

  def seed_production
    seed_categories
    seed_menu_groups
    seed_menu_items
    seed_permissions
    seed_roles
    seed_users
    seed_orders
    attach_images
  end

  def seed_categories
    return if Category.any?

    categories = %w[Tacos Entradas Grandes Postres Bebidas]
    categories.each do |category|
      Category.create(name: category)
      # puts "created Category: #{category}"
    end
  end

  def seed_menu_groups
    return if MenuGroup.any?

    menu_groups = ['Milkshakes', 'Soft Drinks', 'Tequilas']
    menu_groups.each do |menu_group|
      MenuGroup.create(name: menu_group)
      # puts "created Menu Group: #{menu_group}"
    end
  end

  def seed_menu_items
    return if MenuItem.any?

    tacos_category = Category.find_by!(name: 'Tacos')
    MenuItem.create!(name: 'Al Pastor', price: 600,
                     description: 'Free-range spiced pork, achiote, guajillo chile, pineapple-habanero sala',
                     category: tacos_category)
    MenuItem.create!(name: 'Carne Asada', price: 600,
                     description: 'Marinated grilled beef, fresh-herb salsa',
                     category: tacos_category)
    MenuItem.create!(name: 'Pescado', price: 650,
                     description: 'Corn battered fish, jalapeño mayo, coleslaw salad, pico de gallo',
                     category: tacos_category)
    MenuItem.create!(name: 'Tinga de Pollo', price: 600,
                     description: 'Free-range chicken, chipotle-tomato salsa, black beans',
                     category: tacos_category)
    MenuItem.create!(name: 'Wagyu Beef', price: 600,
                     description: 'Wagyu beef brisked, pickled red radish, salsa verde',
                     category: tacos_category)
    MenuItem.create!(name: 'De Frijoles', price: 600,
                     description: 'Fried beans and salsa',
                     category: tacos_category)

    entree_category = Category.find_by!(name: 'Entradas')
    MenuItem.create!(name: 'Papas Fritas', price: 1200,
                     description: 'Crispy fried potatoes, salsa roja, maggi aioli',
                     category: entree_category)
    MenuItem.create!(name: 'Chilaquiles', price: 900,
                     description: 'Tortilla chips, salsa verde, house mix cheeses, crema',
                     category: entree_category)
    MenuItem.create!(name: 'Guacamole', price: 950,
                     description: 'Crushed avocado, tomato, onion, chile, coriander and lime juice',
                     category: entree_category)
    MenuItem.create!(name: 'Beef Cheek Empanadas', price: 900,
                     description: 'Beef cheek and black bean empanadas served with sour cream',
                     category: entree_category)
    MenuItem.create!(name: 'Ocean Trout Ceviche', price: 2400,
                     description: 'Fresh caught ocean trout Ceviche with grapefruit, avocado and pickled cucumber',
                     category: entree_category)
    MenuItem.create!(name: 'Kingfish Tostada', price: 1000,
                     description: 'Kingfish Tostada with cucumber and habanero salsa',
                     category: entree_category)
    MenuItem.create!(name: 'Watermelon Salad', price: 1800,
                     description: 'With Queso Fresco, Mint & Lime',
                     category: entree_category)
    MenuItem.create!(name: 'Corn', price: 1400,
                     description: 'With Paprika Butter & Manchego Cheese',
                     category: entree_category)

    grandes_categories = Category.find_by!(name: 'Grandes')
    MenuItem.create!(name: 'Carnitas', price: 4000,
                     description: 'Wood roasted pork belly, hibiscus and plum chamoy',
                     category: grandes_categories)
    MenuItem.create!(name: 'Pescado a la Parrilla', price: 2400,
                     description: 'Whole grilled flathead, ajo blanco, pistacchio crumb',
                     category: grandes_categories)
    MenuItem.create!(name: 'BBQ Achiote Spatchcock', price: 4200,
                     description: 'Served black garlic, grilled corn, roast pineapple',
                     category: grandes_categories)
    MenuItem.create!(name: 'Lamb Barbacoa', price: 2400,
                     description: 'Served with chilli, lime creme fraiche, fresh coorn tortillas',
                     category: grandes_categories)

    postres_category = Category.find_by!(name: 'Postres')
    MenuItem.create!(name: 'Churros', price: 1200,
                     description: 'Churros with bourbon caramel',
                     category: postres_category)
    MenuItem.create!(name: 'Flan', price: 1000,
                     description: 'Flan de naranja tradicional',
                     category: postres_category)
    MenuItem.create!(name: 'Pastel de Elote', price: 1000,
                     description: 'Corn cake with dulce de leche atole',
                     category: postres_category)

    bebidas_category = Category.find_by!(name: 'Bebidas')
    # milkshakes_group = MenuGroup.find_by!(name: 'Milkshakes')

    # GroupMenuItem.create!(
    #   menu_group: milkshakes_group,
    #   menu_item: MenuItem.create!(
    #     name: 'Chocolate Milkshake', price: 900,
    #     description: "It's a chocolate milkshake", category: bebidas_category
    #   ),
    #   variant_name: 'Chocolate'
    # )
    # # puts 'created MenuItem: Chocolate Milkshake'

    # GroupMenuItem.create!(
    #   menu_group: milkshakes_group,
    #   menu_item: MenuItem.create!(
    #     name: 'Strawberry Milkshake', price: 900,
    #     description: "It's a strawberry milkshake", category: bebidas_category
    #   ),
    #   variant_name: 'Strawberry'
    # )
    # # puts 'created MenuItem: Strawberry Milkshake'

    # GroupMenuItem.create!(
    #   menu_group: milkshakes_group,
    #   menu_item: MenuItem.create!(
    #     name: 'Banana Milkshake', price: 900,
    #     description: "It's a banana milkshake", category: bebidas_category
    #   ),
    #   variant_name: 'Banana'
    # )
    # # puts 'created MenuItem: Banana Milkshake'

    # GroupMenuItem.create!(
    #   menu_group: milkshakes_group,
    #   menu_item: MenuItem.create!(
    #     name: 'Caramel Milkshake', price: 900,
    #     description: "It's a caramel milkshake", category: bebidas_category
    #   ),
    #   variant_name: 'Caramel'
    # )
    # # puts 'created MenuItem: Caramel Milkshake'

    soft_drinks_group = MenuGroup.find_by!(name: 'Soft Drinks')

    GroupMenuItem.create!(
      menu_group: soft_drinks_group,
      menu_item: MenuItem.create!(
        name: 'Coca Cola', price: 400,
        description: 'Fizzy cola', category: bebidas_category
      ),
      variant_name: 'Coca Cola'
    )
    # puts 'created MenuItem: Coca Cola'

    GroupMenuItem.create!(
      menu_group: soft_drinks_group,
      menu_item: MenuItem.create!(
        name: 'Sprite', price: 400,
        description: 'Fizzy lemonade', category: bebidas_category
      ),
      variant_name: 'Sprite'
    )
    # puts 'created MenuItem: Sprite'

    GroupMenuItem.create!(
      menu_group: soft_drinks_group,
      menu_item: MenuItem.create!(
        name: 'Fanta', price: 400,
        description: 'Fizzy orange', category: bebidas_category
      ),
      variant_name: 'Fanta'
    )
    # puts 'created MenuItem: Fanta'

    tequilas_group = MenuGroup.find_by!(name: 'Tequilas')

    GroupMenuItem.create!(
      menu_group: tequilas_group,
      menu_item: MenuItem.create!(
        name: 'Arette Blanco', price: 1300,
        description: 'Floral, fruity notes, pepper, earth, light smoke', category: bebidas_category
      ),
      variant_name: 'Arette Blanco'
    )
    # puts 'created MenuItem: Arette Blanco'

    GroupMenuItem.create!(
      menu_group: tequilas_group,
      menu_item: MenuItem.create!(
        name: 'Fortaleza Reposado', price: 2000,
        description: 'Soft, citrus & caramel, butter, vanilla, apple', category: bebidas_category
      ),
      variant_name: 'Fortaleza Reposado'
    )
    # puts 'created MenuItem: Fortaleza Reposado'

    GroupMenuItem.create!(
      menu_group: tequilas_group,
      menu_item: MenuItem.create!(
        name: 'Cascahuin Tahona Blanco', price: 1900,
        description: 'Umami, cheese, baked agave, green capsicum', category: bebidas_category
      ),
      variant_name: 'Cascahuin Tahona Blanco'
    )
    # puts 'created MenuItem: Cascahuin Tahona Blanco'

    GroupMenuItem.create!(
      menu_group: tequilas_group,
      menu_item: MenuItem.create!(
        name: 'Calle 23 Blanco', price: 1400,
        description: 'Agave, citrus, apple, pear & black pepper spice', category: bebidas_category
      ),
      variant_name: 'Calle 23 Blanco'
    )
    # puts 'created MenuItem: Calle 23 Blanco'
  end

  def seed_permissions
    return if Permission.any?

    Permission.create!(name: :read_users)
    Permission.create!(name: :write_users)
    Permission.create!(name: :read_orders)
    Permission.create!(name: :write_orders)
    Permission.create!(name: :read_menu)
    Permission.create!(name: :write_menu)
  end

  def seed_roles
    return if Role.any?

    # read_users_permission = Permission.find_by!(name: :read_users)
    write_users_permission = Permission.find_by!(name: :write_users)

    read_orders_permission = Permission.find_by!(name: :read_orders)
    write_orders_permission = Permission.find_by!(name: :write_orders)

    # read_menu_permission = Permission.find_by!(name: :read_menu)
    write_menu_permission = Permission.find_by!(name: :write_menu)

    admin_role = Role.create!(name: 'Admin')
    admin_role.permissions.push(write_users_permission, write_orders_permission, write_menu_permission)
    # puts 'created Role: Admin'

    manager_role = Role.create!(name: 'Manager')
    manager_role.permissions.push(write_orders_permission, write_menu_permission)
    # puts 'created Role: Manager'

    chef_role = Role.create!(name: 'Chef')
    chef_role.permissions.push(read_orders_permission)
    # puts 'created Role: Chef'

    watier_role = Role.create!(name: 'Waiter')
    watier_role.permissions.push(read_orders_permission)
    # puts 'created Role: Waiter'
  end

  def seed_users
    return if User.any?

    admin_role = Role.find_by!(name: 'Admin')
    User.create!(userable: Employee.new(role: admin_role),
                 first_name: 'Admin', last_name: 'User', email: 'admin@mexiqui.to',
                 password: 'reallydifficultadminpassword', password_confirmation: 'reallydifficultadminpassword')
    # puts 'created Admin User'

    return if Rails.env.production?

    manager_role = Role.find_by!(name: 'Manager')
    User.create!(userable: Employee.new(role: manager_role),
                 first_name: 'Manager', last_name: 'User', email: 'manager@mexiqui.to',
                 password: 'reallydifficultmanagerpassword', password_confirmation: 'reallydifficultmanagerpassword')
    # puts 'created Manager User'

    chef_role = Role.find_by!(name: 'Chef')
    User.create!(userable: Employee.new(role: chef_role),
                 first_name: 'Chef', last_name: 'User', email: 'chef@mexiqui.to',
                 password: 'reallydifficultchefpassword', password_confirmation: 'reallydifficultchefpassword')
    # puts 'created Chef User'

    waiter_role = Role.find_by!(name: 'Waiter')
    User.create!(userable: Employee.new(role: waiter_role),
                 first_name: 'Waiter', last_name: 'User', email: 'waiter@mexiqui.to',
                 password: 'reallydifficultwaiterpassword', password_confirmation: 'reallydifficultwaiterpassword')
    # puts 'created Waiter User'

    User.create!(userable: Customer.new,
                 first_name: 'Ezio', last_name: 'Auditore', email: 'ezio@monteriggioni.it',
                 password: 'nothingistrueeverythingispermitted', password_confirmation: 'nothingistrueeverythingispermitted')
    # puts 'created Customer'
  end

  def seed_orders
    return if Order.any?

    # ORDER 1

    first_order = Order.create!(table: 0, name: 'Ezio', email: 'ezio@monteriggioni.it')
    # puts 'created a new Order'

    papas_fritas_menu_item = MenuItem.find_by!(name: 'Papas Fritas')
    OrderItem.create!(order: first_order, menu_item: papas_fritas_menu_item, price_at_order: papas_fritas_menu_item.price)
    # puts 'added Papas Fritas to this order'

    tinga_de_pollo_menu_item = MenuItem.find_by!(name: 'Tinga de Pollo')
    OrderItem.create!(order: first_order, menu_item: tinga_de_pollo_menu_item, price_at_order: tinga_de_pollo_menu_item.price)
    # puts 'added Tinga de Pollo to this order'

    churros_menu_item = MenuItem.find_by!(name: 'Churros')
    OrderItem.create!(order: first_order, menu_item: churros_menu_item, price_at_order: churros_menu_item.price)
    # puts 'added Churros to this order'
    first_order.save!

    first_order.update!(updated_by: User.employees.find_by(first_name: 'Manager'))

    # ORDER 2

    second_order = Order.create!(table: 3, name: 'Koray', email: 'koray@test.com')
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Al Pastor'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Carne Asada'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Coca Cola'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Pastel de Elote'))
    second_order.save!

    # ORDER 3

    second_order = Order.create!(table: 5, name: 'Leigh', email: 'leigh@test.com')
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Chilaquiles'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Pescado'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Carnitas'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Coca Cola'))
    second_order.save!

    # ORDER 4

    second_order = Order.create!(table: 2, name: 'Iryna', email: 'iryna@test.com')
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Wagyu Beef'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Tinga de Pollo'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Lamb Barbacoa'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Flan'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Cascahuin Tahona Blanco'))
    second_order.save!

    # ORDER 5

    second_order = Order.create!(table: 6, name: 'JK', email: 'jk@test.com')
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Papas Fritas'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Tinga de Pollo'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Carnitas'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Al Pastor'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'BBQ Achiote Spatchcock'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Coca Cola'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Calle 23 Blanco'))
    second_order.save!

    # ORDER 6

    second_order = Order.create!(table: 1, name: 'Jarrod', email: 'jarrod@test.com')
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Guacamole'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Papas Fritas'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Pescado'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Tinga de Pollo'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Beef Cheek Empanadas'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Pescado a la Parrilla'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'De Frijoles'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Churros'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Flan'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Sprite'))
    OrderItem.create!(order: second_order, menu_item: MenuItem.find_by!(name: 'Fortaleza Reposado'))
    second_order.save!
  end

  def attach_images
    images = Dir[Rails.root.join('app', 'helpers', 'seed_data', 'images', 'menu_item_*.*')]
    puts "Found #{images.length} images"

    images.each do |image|
      basename = File.basename(image)

      regex = /menu_item_(?<menu_item_name>.*)\.(?<image_extension>[a-z]{1,4})/

      matches = basename.match(regex)
      menu_item_name = matches[:menu_item_name]
      image_extension = matches[:image_extension]

      raise StandError, "Couldn't regex match menu_item_name from filename #{basename}" if menu_item_name.empty? || image_extension.empty?

      menu_item = MenuItem.find_by!(name: menu_item_name)
      puts "Menu Item: #{menu_item_name}"
      unless menu_item.image.attached?
        menu_item.image.attach(io: File.open(image), filename: basename)
        puts "Attached image for #{menu_item.name}"
      end
    end
  end
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/ClassLength
