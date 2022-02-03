# frozen_string_literal: true

class MenuItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_menu_item, only: [:update]

  def index
    render json: MenuItem.visible.map(&:transform_menu_item), status: :ok
  end

  def index_grouped
    render json: MenuItem.grouped_menu_items, status: :ok
  end

  def create
    @menu_item = MenuItem.create(menu_item_params)
    
    if @menu_item.errors.any?
      render json: @menu_item.errors, status: :unprocessable_entity
    else
      render json: @menu_item, status: 201
    end
  end

  def update
    @menu_item.update(menu_item_params)

    if @menu_item.errors.any?
      render json: @menu_item.errors, status: :unprocessable_entity
    else
      render json: @menu_item, status: 201
    end
  end
  

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :description, :category_id)
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end
end
