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
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(params_int(item_params))
    redirect_to "/home/exhibit_product/#{@item.id}"
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    param.require.(:item).permit(:name, :description, :category, :condition, :postage, :region, :days, :price, item_image_attributes: [:item_id, :image])
  end

  def params_int(item_params)
    item_params.each do |key,value|
      if integer_string?(value)
        item_params[key]=value.to_i
      end
    end
  end

  def integer_string?(str)
    Integer(str)
    true
  rescue ArgumentError
    false
 end

end


