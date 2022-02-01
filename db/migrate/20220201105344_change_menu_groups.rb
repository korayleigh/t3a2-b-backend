class ChangeMenuGroups < ActiveRecord::Migration[6.1]
  def change
    rename_column :group_menu_items, :group_id, :menu_group_id
  end
end
