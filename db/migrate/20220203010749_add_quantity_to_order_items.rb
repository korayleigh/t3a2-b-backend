# frozen_string_literal: true

class AddQuantityToOrderItems < ActiveRecord::Migration[6.1]
  def change
    add_column :order_items, :quantity, :integer, default: 1, null: false
  end
end
