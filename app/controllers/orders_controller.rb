# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :set_order, only: [:show]

  def index
    render json: Order.all.map(&:transform_order), status: :ok
  end

  def show
    if @order
      render json: @order.transform_order, status: :ok
    else
      render json: { error: 'Order not found' }, staus: :unprocessable_entity
    end
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end
end
