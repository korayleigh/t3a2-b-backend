class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.integer :status
      t.integer :price_at_order
      t.text :request

      t.timestamps
    end
  end
end
