# frozen_string_literal: true

class MenuGroup < ApplicationRecord
  has_many :group_menu_items
  has_many :menu_items, through: :group_menu_items
end
