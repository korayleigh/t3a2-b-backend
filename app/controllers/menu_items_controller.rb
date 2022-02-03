# frozen_string_literal: true

class MenuItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_menu_item, only: [:show]

  def index
    render json: MenuItem.visible.to_h(&:transform_menu_item_list), status: :ok
  end

  def index_grouped
    render json: MenuItem.grouped_menu_items, status: :ok
  end

  def show
    render json: @menu_item.transform_menu_item
  end

  private

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end
end
