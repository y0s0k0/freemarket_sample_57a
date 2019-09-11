class ItemsController < ApplicationController
  # before_action :find_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
    # 3.times{@item.item_images.build}
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    
    @item.save
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    param.require.(:item).permit(:name, :description, :category, :condition, :postage, :region, :days, :price, item_image_attributes: [:item_id, :image])
  end

end


