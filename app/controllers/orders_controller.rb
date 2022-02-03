# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    render json: Order.all.to_h(&:transform_order_list), status: :ok
  end

  def show
    render json: @order.transform_order, status: :ok
  end

  def create
    # strong parameters
    order_attributes = order_params

    # removes the nested array of order items and saves it separately
    order_items_attributes = order_attributes.delete('order_items')

    # make a new order instance
    @order = Order.new(order_attributes)

    # add the order_items to it
    @order.order_items = order_items_attributes.map do |order_item_parameters|
      OrderItem.new(order_item_parameters.merge({ price_at_order: MenuItem.find(order_item_parameters[:menu_item_id]).price }))
    end

    @order.save

    if @order.errors.any?
      render json: @order.errors, status: :unprocessable_entity
    else
      render json: @order.transform_order, status: :ok
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end

  def order_params
    params.require(:order).permit(:table, :name, :email, order_items: %i[menu_item_id quantity])
  end
end
