# frozen_string_literal: true

class ChangeCategories < ActiveRecord::Migration[6.1]
  def change
    change_column_null :categories, :name, false
  end
end
