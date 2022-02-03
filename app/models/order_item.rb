# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :order

  enum status: {
    cancelled: -1,
    received: 0,
    in_progress: 1,
    complete: 2
  }

  def transform_order_item
    {
      id: id,
      menu_item_id: menu_item_id,
      status: status,
      price_at_order: price_at_order,
      quantity: quantity,
      request: request
    }
  end

  def transform_order_item_list
    [id, transform_order_item]
  end
end
