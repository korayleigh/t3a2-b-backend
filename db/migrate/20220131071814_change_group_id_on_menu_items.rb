# frozen_string_literal: true

class ChangeGroupIdOnMenuItems < ActiveRecord::Migration[6.1]
  def change
    change_column_null :menu_items, :group_id, from: true, to: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
