class MenuItemsController < ApplicationController

  def index
    render json: MenuItem.visible.map(&:transform_menu_item), status: :ok
  end

  private

  def set_menu_item
    @menu_item = Menu.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end
end
