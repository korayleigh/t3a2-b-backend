# frozen_string_literal: true

class GroupMenuItem < ApplicationRecord
  belongs_to :menu_item
  belongs_to :menu_group

  scope :visible, -> { joins(:menu_item).where(menu_item: { visible: true }) }
end
