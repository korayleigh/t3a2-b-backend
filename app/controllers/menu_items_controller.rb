# frozen_string_literal: true

class MenuItemsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_menu_item, only: %i[show update destroy]

  def index
    # render json: MenuItem.visible.to_h(&:transform_menu_item_list), status: :ok
    render json: MenuItem.visible, status: :ok
  end

  def show
    # render json: MenuItem.visible.to_h(&:transform_menu_item_list), status: :ok
    puts("id: #{@menu_item.id}")
    # path = Rails.application.routes.url_helpers.rails_blob_path(@menu_item.image, only_path: true)
    render json: url_for(@menu_item.image), status: :ok
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

  def destroy
    @menu_item.destroy
    render status: :no_content
  end

  private

  def menu_item_params
    params.permit(:name, :price, :description, :category_id, :image)
  end

  def set_menu_item
    @menu_item = MenuItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end
end
