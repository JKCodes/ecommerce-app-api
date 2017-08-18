class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]

  def index
    render json: Category.All
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category
    else
      render json: { error: category.errors }, status: 400
    end
  end

  def show
    render json: @category
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: { error: category.errors }, status: 400
    end
  end

  private

    def set_category
      @category = Category.find_by(id: params[:id])
    end

    def category_params
      params.require(:category).permit(:title)
    end
end