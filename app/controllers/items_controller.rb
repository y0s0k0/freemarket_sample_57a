class ItemsController < ApplicationController

  def new
    
    @item = Item.new
    @item.item_images.build
    @category_parent_array = Category.where(ancestry: nil)
  end

  def get_category_children
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    # @item = Item.new(item_params)
    # @item.save
    # binding.pry
    # ItemImage.create(item_id: @item.id, image: image_params)
    # redirect_to root_path
    @item = Item.new(item_params)
    @item.save
    # @item.item_images.create(item_id: current_user.id, image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-WZ8C7WkQNDWIFJnZ8A_mH2aTE1tYLPnsNp5KOSudh3rHX4CTyA")
    redirect_to root_path
  end

  def show
    @item = Item.find(params[:id])
    # @image = ItemImage.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @category_parent_array = Category.where(ancestry: nil)
    # @image = ItemImage.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    # @item.update(params_int(item_params))
    redirect_to "/home/exhibit_product/#{@item.id}"
  end

  private

  def image_params
    params.require(:item_images).permit(:image)
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :condition,
      :postage,
      :region,
      :delivery_schedule,
      :price).merge(seller_id: current_user.id).merge(set_exhibit)
  end

  # def image_params
  #   params.require(:item_image).permit(images: []})
  # end
  
  def set_exhibit
    {transaction_condition: 1}
  end

end




