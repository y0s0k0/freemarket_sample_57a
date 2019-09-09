class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
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
    def item_params
      params.require(:item).permit(:image, :name, :description, :category, :size, :brand, :condition, :postage, :region, :days, :price, :transaction_condition, :user_id)
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


