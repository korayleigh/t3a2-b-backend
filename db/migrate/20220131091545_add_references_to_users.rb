# frozen_string_literal: true

class AddReferencesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :userable, polymorphic: true
  end
end
