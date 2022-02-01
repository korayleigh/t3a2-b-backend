# frozen_string_literal: true

class MenuItem < ApplicationRecord
  belongs_to :category
  belongs_to :group, optional: true
  has_many :order_items
  has_many :orders, through: :order_items

  scope :visible, -> { where(:visible => true)}

  def transform_menu_item
    {
      id: id,
      name: name,
      price: price,
      description: description,
      category_id: category_id,
      category: category.name
    }

  end
end
