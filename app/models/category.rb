# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :menu_items
end
