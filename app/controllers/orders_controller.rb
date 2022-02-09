# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: %i[show update destroy]

  def index
    render json: Order.all.to_h(&:transform_order_list), status: :ok
  end

  def show
    render_json(:ok)
  end

  def create
    @order = Order.create(order_params)
    render_json(:created)
  end

  def update
    @order.update(order_params)
    render_json(:ok)
  end

  def destroy
    @order.destroy
    render status: :no_content
  end

  def tables
    render json: Order.tables, status: :ok
  end

  private

  def set_order
    @order = Order.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end

  def order_params
    params.require(:order).permit(:table, :name, :email, order_items_attributes: %i[id menu_item_id quantity])
  end

  def render_json(status)
    if @order.errors.any?
      render json: @order.errors, status: :unprocessable_entity
    else
      render json: @order.transform_order, status: status
    end
  end
end
