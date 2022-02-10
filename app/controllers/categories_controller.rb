# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_category, only: %i[show update destroy]

  def index
    render json: Category.all.to_h(&:transform_category_list), status: :ok
  end

  def show
    render_json(:ok)
  end

  def create
    @category = Category.create(category_params)
    render_json(:created)
  end

  def update
    @category.update(category_params)
    render_json(:ok)
  end

  def destroy
    @category.destroy
    render status: :no_content
  end

  private

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Not Found' }, status: :not_found
  end

  def category_params
    params.require(:category).permit(:name)
  end

  def render_json(status)
    if @category.errors.any?
      render json: @category.errors, status: :unprocessable_entity
    else
      render json: @category.transform_category, status: status
    end
  end
end
