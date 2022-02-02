# frozen_string_literal: true

class AddDetailsToOrders < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :created_by, foreign_key: { to_table: :users }, index: true
    add_reference :orders, :updated_by, foreign_key: { to_table: :users }, index: true
  end
end
