# frozen_string_literal: true

class MenuItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: MenuItem.visible.map(&:transform_menu_item), status: :ok
  end

  def index_grouped
    render json: MenuItem.grouped_menu_items, status: :ok
  end

  private

  def set_menu_item
    @menu_item = Menu.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end
end
