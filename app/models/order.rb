# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items
  has_many :menu_items, through: :order_items

  belongs_to :owner, class_name: 'User', optional: true
  belongs_to :created_by, class_name: 'User', optional: true
  belongs_to :updated_by, class_name: 'User', optional: true

  enum table: {
    TakeAway: 0,
    Table1: 1,
    Table2: 2,
    Table3: 3,
    Table4: 4,
    Table5: 5,
    Table6: 6
  }

  def total
    order_items.sum('price_at_order * quantity')
  end

  def total_dollars
    total / 100.0
  end

  def transform_order
    [id, {
      id: id,
      table: table,
      name: name,
      email: email,
      owner: owner&.name,
      created_by: created_by&.name,
      updated_by: updated_by&.name,
      total: total_dollars
    }]
  end
end
