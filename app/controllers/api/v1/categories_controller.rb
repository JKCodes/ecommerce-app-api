class Api::V1::CategoriesController < ApplicationController

  def index
    render json: Category.All
  end

  def create

  end

  def show
    render json: Category.find_by(id: params[:id])
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end