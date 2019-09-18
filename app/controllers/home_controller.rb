class HomeController < ApplicationController
  def index
    @index_item = Item.all.order("id DESC").limit(10)
    @image = ItemImage.all.order("id DESC").limit(10)
    @item = Item.all
    @parents = Category.where(ancestry: nil)
  end

  def mypage
  end

  def profile
  end

  def logout
  end

  def identification
    @user = current_user
  end

  def list_exhibit
    @item = Item.all.order("id DESC")
    @image = ItemImage.all.order("id DESC")
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @item_count = Item.where('name LIKE(?)', "%#{params[:keyword]}%").count
    @key = params[:keyword]
    @image = ItemImage.all
  end

  def exhibit_product
    @item = Item.find(params[:id])
    @image = ItemImage.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to home_list_exhibit_path
  end

  def card 
  end
end
