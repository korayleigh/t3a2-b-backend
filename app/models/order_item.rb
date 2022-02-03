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

  def price_at_order_dollars
    price_at_order / 100.0
  end
end
