# frozen_string_literal: true

class MenuItemsController < ApplicationController
  # before_action :authenticate_user!

  def index
    render json: MenuItem.visible.map(&:transform_menu_item), status: :ok
  end

  def index_grouped
    render json: MenuItem.grouped_menu_items, status: :ok
  end

  def create
    @menu_item = MenuItem.new
  end
  

  private

  def menu_item_params
    params.require(:menu_item).permit(:id, :name, :price, :description, :category_id)
  end

  # "id": 10,
  # "name": "Churros",
  # "price": 1200,
  # "description": "Churros with bourbon caramel",
  # "category_id": 4,
  # "category": "Postres"
  

  def set_menu_item
    @menu_item = Menu.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end
end
