class OrderItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :order

  enum status: {
    cancelled: -1,
    received: 0,
    in_progress: 1,
    complete: 2
  }
end
