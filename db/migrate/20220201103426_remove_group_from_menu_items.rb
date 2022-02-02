# frozen_string_literal: true

class RemoveGroupFromMenuItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :menu_items, :group_id
  end
end
