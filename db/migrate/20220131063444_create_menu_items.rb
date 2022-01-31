# frozen_string_literal: true

class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.text :description, null: false
      t.boolean :visible, null: false, default: true
      t.references :category, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
