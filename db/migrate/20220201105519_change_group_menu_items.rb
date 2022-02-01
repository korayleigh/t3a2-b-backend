class ChangeGroupMenuItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :group_menu_items, :variant_name, false
  end
end
