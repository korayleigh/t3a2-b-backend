# frozen_string_literal: true

class ChangeGroupToMenuGroup < ActiveRecord::Migration[6.1]
  def change
    rename_table :groups, :menu_groups
  end
end
