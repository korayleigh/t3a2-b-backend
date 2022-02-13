# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order_item, only: %i[show update destroy pending_advance]

  def index
    render json: OrderItem.all.to_h(&:transform_order_item_list), status: :ok
  end

  def show
    render_json(:ok)
  end

  def create
    @order_item = OrderItem.create(order_item_params_create)
    render_json(:created)
  end

  def update
    @order_item.update(order_item_params_update)
    render_json(:ok)
  end

  def destroy
    @order_item.destroy
    render status: :no_content
  end

  def statuses
    render json: OrderItem.statuses, status: :ok
  end

  def pending
    render json: OrderItem.pending.to_h(&:transform_order_item_list), status: :ok
  end

  def pending_advance
    if @order_item.received?
      @order_item.update(status: :in_progress)
    elsif @order_item.in_progress?
      @order_item.update(status: :complete)
    end

    headers['Last-Modified'] = Time.now.httpdate
    # render_json(:ok)
    render json: OrderItem.pending.to_h(&:transform_order_item_list), status: :ok
  end

  private

  def set_order_item
    @order_item = OrderItem.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end

  def order_item_params_create
    params.require(:order_item).permit(:order_id, :menu_item_id, :quantity, :price_at_order, :request)
  end

  def order_item_params_update
    params.require(:order_item).permit(:menu_item_id, :status, :quantity, :price_at_order, :request)
  end

  def render_json(status)
    if @order_item.errors.any?
      pp @order_item.errors
      render json: @order_item.errors, status: :unprocessable_entity
    else
      render json: @order_item.transform_order_item, status: status
    end
  end
end
