# frozen_string_literal: true

class AddRoleToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :role, null: false, foreign_key: true
  end
end
