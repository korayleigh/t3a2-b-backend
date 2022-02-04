# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :menu_items, through: :order_items

  belongs_to :owner, class_name: 'User', optional: true
  belongs_to :created_by, class_name: 'User', optional: true
  belongs_to :updated_by, class_name: 'User', optional: true

  validates :table, presence: true
  validates :name, presence: true
  validates :email, presence: true

  accepts_nested_attributes_for :order_items

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

  def transform_order
    order_hash = {
      id: id,
      table: table,
      name: name,
      email: email,
      total: total,
      created_at: created_at,
      order_items: order_items.to_h(&:transform_order_item_list)
    }
    order_hash.merge({ owner: owner.name }) if owner
    order_hash.merge({ createad_by: created_by.name }) if created_by
    order_hash.merge({ updated_by: updated_by.name }) if updated_by
    order_hash
  end

  def transform_order_list
    [id, transform_order]
  end
end
