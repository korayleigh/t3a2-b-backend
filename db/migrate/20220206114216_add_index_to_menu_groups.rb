# frozen_string_literal: true

class AddIndexToMenuGroups < ActiveRecord::Migration[6.1]
  def change
    add_index :menu_groups, :name, unique: true
  end
end
