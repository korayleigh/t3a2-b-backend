class Order < ApplicationRecord
  has_many :menu_items, through: :order_items
  enum table: {
    TakeAway: 0,
    Table1: 1,
    Table2: 2,
    Table3: 3,
    Table4: 4,
    Table5: 5,
    Table6: 6
  }
end
