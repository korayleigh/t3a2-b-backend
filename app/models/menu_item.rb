# frozen_string_literal: true

require 'action_view/helpers/url_helper'

class MenuItem < ApplicationRecord
  belongs_to :category
  has_one :group_menu_item
  has_one :menu_group, through: :group_menu_item
  has_many :order_items
  has_many :orders, through: :order_items
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, presence: true

  scope :visible, -> { where(visible: true).joins(:category).order('name ASC') }
  scope :ungrouped, -> { where.missing(:group_menu_item) }

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

  def transform_menu_item_list
    [id, transform_menu_item]
  end

  def self.grouped_menu_items
    menu_groups_response_hash = MenuGroup.all.map do |menu_group|
      menu_group_hash = menu_group.group_menu_items.visible.to_h do |group_menu_item|
        [group_menu_item.variant_name, group_menu_item.menu_item.transform_menu_item]
      end
      { type: menu_group.class.name, group: menu_group_hash }
    end

    menu_items_response_hash = MenuItem.visible.ungrouped.map do |menu_item|
      { type: menu_item.class.name, item: menu_item.transform_menu_item }
    end

    menu_groups_response_hash.concat(menu_items_response_hash)
  end
end
