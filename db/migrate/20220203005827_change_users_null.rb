# frozen_string_literal: true

class ChangeUsersNull < ActiveRecord::Migration[6.1]
  def change
    change_column_null :users, :userable_type, false
    change_column_null :users, :userable_id, false
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false
  end
end
