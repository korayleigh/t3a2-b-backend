# frozen_string_literal: true

class MenuItem < ApplicationRecord
  belongs_to :category
  belongs_to :group, optional: true
end
