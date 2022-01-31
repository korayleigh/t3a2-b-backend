class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :table
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
