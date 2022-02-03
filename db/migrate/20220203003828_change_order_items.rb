# frozen_string_literal: true

class ChangeOrderItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :order_items, :status, false
    change_column_default :order_items, :status, 0
    change_column_null :order_items, :price_at_order, false
  end
end
