class HomeController < ApplicationController
  def index
    @index_item = Item.all.limit(10)
    @item = Item.all
  end

  def mypage
  end

  def profile
  end

  def logout
  end

  def identification

  end

  def list_exhibit
    @item = Item.all
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @item_count = Item.where('name LIKE(?)', "%#{params[:keyword]}%").count
    @key = params[:keyword]
  end

  def exhibit_product
    @item = Item.find(params[:id])
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to home_list_exhibit_path
  end

  def card 
  end
end
