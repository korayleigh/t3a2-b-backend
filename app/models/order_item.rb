# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :order

  validates :order, presence: true
  validates :menu_item, presence: true
  validates :quantity, presence: true
  validates :price_at_order, presence: true

  before_validation :insert_price_at_order

  enum status: {
    cancelled: 1,
    received: 2,
    in_progress: 3,
    complete: 4
  }

  scope :pending, -> { where(status: %i[received in_progress]).order(created_at: :desc) }

  def transform_order_item
    order_item_hash = {
      id: id,
      order_id: order_id,
      menu_item_id: menu_item_id,
      menu_item: menu_item.name,
      status: status,
      price_at_order: price_at_order,
      quantity: quantity,
      created_at: created_at,
      updated_at: updated_at
    }
    order_item_hash.merge(
      request ? { request: request } : {}
    )
  end

  def transform_order_item_list
    [id, transform_order_item]
  end

  def insert_price_at_order
    self.price_at_order = MenuItem.find(menu_item_id).price unless price_at_order
  end
end
