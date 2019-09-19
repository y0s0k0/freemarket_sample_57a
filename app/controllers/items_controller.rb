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
    # @item = Item.new(item_params.merge(set_exhibit).merge(user_id: 1))
    @item = Item.new(item_params)
    # binding.pry
    # if @item.save
    #   @item_image = params[:item_images][:image].map {|img| img.original_filename}
    #   binding.pry
    #   @item_image.each do |img|
    #     ItemImage.create(image: img)
    #   end
    @item.save
    # binding.pry
    @item.item_images.create(image_params)
    # if @item.save
    #   params[:item_images][:image].each do |img|
    #     # @image = ItemImage.new()
    #     binding.pry
    #     ItemImage.create(image: img, item_id: @item.id)
    #   end
      # params[:item_images]each do |img|
      #   @item_image = ItemImage.new(image: img.original_filename)
      #   @item_image.save
      # end
      redirect_to root_path
    # else
    #   redirect_to new_item_path
    # end
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

  # def category
  #   @parents = Category.where(ancestry: nil)
  # end
  
  # def search
  #   respond_to do |format|
  #     format.html
  #     format.json do
  #       @children = Category.find(params[:parent_id]).children
  #     end
  #   end
  # end

  private

  # def set_item
  #   @item = 
  # end

  # def find_item
  #   @item = Item.find(params[:id])
  # end

  # def item_params
  #   params.require(:item).permit(
  #     :name,
  #     :description,
  #     :category_id,
  #     :condition,
  #     :postage,
  #     :region,
  #     :delivery_schedule,
  #     :price,
  #     item_images_attributes: [:item_id, {image: []}]).merge(seller_id: current_user.id).merge(set_exhibit)
  # end

  def image_params
    params.require(:item_images).permit(:item_id, {image: []})
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
      :price)
  end

  # def image_params
  #   params.require(:item_image).permit(:image)
  # end
  
  def set_exhibit
    {transaction_condition: 1}
  end

  # def params_int(item_params)
  #   item_params.each do |key,value|
  #     if integer_string?(value)
  #       item_params[key]=value.to_i
  #     end
  #   end
  # end

  # def integer_string?(str)
  #   Integer(str)
  #   true
  # rescue ArgumentError
  #   false
  # end

end



