# frozen_string_literal: true

class MenuItemSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :name, :price, :description, :category_id, :image

  def image
    return unless object.image.attached?

    url = object.image.service_url if object.image.attached?
    {
      imagePath: url
    }
  end
end

# imagePath: rails_blob_path(object.image, only_path: true)
