# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_203_010_749) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'customers', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'employees', force: :cascade do |t|
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'role_id', null: false
    t.index ['role_id'], name: 'index_employees_on_role_id'
  end

  create_table 'group_menu_items', force: :cascade do |t|
    t.bigint 'menu_group_id', null: false
    t.bigint 'menu_item_id', null: false
    t.string 'variant_name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['menu_group_id'], name: 'index_group_menu_items_on_menu_group_id'
    t.index ['menu_item_id'], name: 'index_group_menu_items_on_menu_item_id', unique: true
  end

  create_table 'jwt_denylist', force: :cascade do |t|
    t.string 'jti', null: false
    t.datetime 'exp', null: false
    t.index ['jti'], name: 'index_jwt_denylist_on_jti'
  end

  create_table 'menu_groups', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'menu_items', force: :cascade do |t|
    t.string 'name', null: false
    t.integer 'price', null: false
    t.text 'description', null: false
    t.boolean 'visible', default: true, null: false
    t.bigint 'category_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['category_id'], name: 'index_menu_items_on_category_id'
  end

  create_table 'order_items', force: :cascade do |t|
    t.bigint 'menu_item_id', null: false
    t.bigint 'order_id', null: false
    t.integer 'status', default: 0, null: false
    t.integer 'price_at_order', null: false
    t.text 'request'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'quantity', default: 1, null: false
    t.index ['menu_item_id'], name: 'index_order_items_on_menu_item_id'
    t.index ['order_id'], name: 'index_order_items_on_order_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.integer 'table', null: false
    t.string 'name', null: false
    t.string 'email', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.bigint 'created_by_id'
    t.bigint 'updated_by_id'
    t.bigint 'owner_id'
    t.index ['created_by_id'], name: 'index_orders_on_created_by_id'
    t.index ['owner_id'], name: 'index_orders_on_owner_id'
    t.index ['updated_by_id'], name: 'index_orders_on_updated_by_id'
  end

  create_table 'permissions', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'permissions_roles', force: :cascade do |t|
    t.bigint 'role_id', null: false
    t.bigint 'permission_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['permission_id'], name: 'index_permissions_roles_on_permission_id'
    t.index ['role_id'], name: 'index_permissions_roles_on_role_id'
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'userable_type', null: false
    t.bigint 'userable_id', null: false
    t.string 'first_name', null: false
    t.string 'last_name', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index %w[userable_type userable_id], name: 'index_users_on_userable'
  end

  add_foreign_key 'employees', 'roles'
  add_foreign_key 'group_menu_items', 'menu_groups'
  add_foreign_key 'group_menu_items', 'menu_items'
  add_foreign_key 'menu_items', 'categories'
  add_foreign_key 'order_items', 'menu_items'
  add_foreign_key 'order_items', 'orders'
  add_foreign_key 'orders', 'users', column: 'created_by_id'
  add_foreign_key 'orders', 'users', column: 'owner_id'
  add_foreign_key 'orders', 'users', column: 'updated_by_id'
  add_foreign_key 'permissions_roles', 'permissions'
  add_foreign_key 'permissions_roles', 'roles'
end
