class ChangeOrdersNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :orders, :table, false
    change_column_null :orders, :name, false
    change_column_null :orders, :email, false
  end
end
