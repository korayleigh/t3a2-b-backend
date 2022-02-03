# frozen_string_literal: true

class ChangeMenuGroupsNameNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :menu_groups, :name, false
  end
end
