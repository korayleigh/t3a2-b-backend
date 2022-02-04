# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :order

  validates :menu_item, presence: true
  validates :quantity, presence: true
  validates :price_at_order, presence: true

  before_validation :insert_price_at_order

  enum status: {
    cancelled: -1,
    received: 0,
    in_progress: 1,
    complete: 2
  }

  def transform_order_item
    order_item_hash = {
      id: id,
      menu_item_id: menu_item_id,
      status: status,
      price_at_order: price_at_order,
      quantity: quantity
    }
    order_item_hash.merge({ request: request }) if request
    order_item_hash
  end

  def transform_order_item_list
    [id, transform_order_item]
  end

  def insert_price_at_order
    self.price_at_order = MenuItem.find(menu_item_id).price unless price_at_order
  end
end
