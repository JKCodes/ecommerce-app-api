class Api::V1::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    render json: Item.all
  end

  def create
    item = Item.new(item_params)
    if item.save
      render json: item
    else
      render json: { error: item.errors }, status: 400
    end
  end

  def show
    render json: @item
  end

  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: { error: item.errors }, status: 400
    end
  end

  def destroy
    if @item.destroy
      render status: 204
    else
      render json: { error: "Unable to delete the requested item" }, status: 400
    end
  end

  private

    def set_item
      @item = Item.find_by(id: params[:id])
    end

    def item_params
      params.require(:item).permit(:title, :inventory, :price, :category_id, :img_url, :description)
    end  
end