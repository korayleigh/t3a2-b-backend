class CreateGroupMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :group_menu_items do |t|
      t.references :group, null: false, foreign_key: true
      t.references :menu_item, null: false, foreign_key: true, index: { unique: true }
      t.string :variant_name
      t.timestamps
    end
  end
end
