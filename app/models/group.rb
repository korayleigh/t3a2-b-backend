# frozen_string_literal: true

class Group < ApplicationRecord
  has_many :menu_items
end
