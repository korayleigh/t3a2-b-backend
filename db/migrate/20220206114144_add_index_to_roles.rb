# frozen_string_literal: true

class AddIndexToRoles < ActiveRecord::Migration[6.1]
  def change
    add_index :roles, :name, unique: true
  end
end
