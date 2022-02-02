# frozen_string_literal: true

class AddOwnerToOrder < ActiveRecord::Migration[6.1]
  def change
    add_reference :orders, :owner, null: true, foreign_key: { to_table: :users }, index: true
  end
end
