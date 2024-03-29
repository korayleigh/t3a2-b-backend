# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :menu_items

  validates :name, presence: true, uniqueness: true

  def transform_category
    {
      id: id,
      name: name,
      menu_items_count: menu_items.length
    }
  end

  def transform_category_list
    [id, transform_category]
  end
end
