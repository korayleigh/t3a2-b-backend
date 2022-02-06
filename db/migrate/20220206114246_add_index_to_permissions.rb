# frozen_string_literal: true

class AddIndexToPermissions < ActiveRecord::Migration[6.1]
  def change
    add_index :permissions, :name, unique: true
  end
end
