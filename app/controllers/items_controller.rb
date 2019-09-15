class ItemsController < ApplicationController
  # before_action :find_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
    @item.item_images.build
    @parents = Category.where(ancestry: nil).order("id ASC")
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
    @image = ItemImage.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @image = ItemImage.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(params_int(item_params))
    redirect_to "/home/exhibit_product/#{@item.id}"
  end

  def category
    @parents = Category.where(ancestry: nil)
  end
  
  def search
    respond_to do |format|
      format.html
      format.json do
        @children = Category.find(params[:parent_id]).children
      end
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category,
      :condition,
      :postage,
      :region,
      :days,
      :price,
      item_images_attributes:[:item_id, :image])
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



