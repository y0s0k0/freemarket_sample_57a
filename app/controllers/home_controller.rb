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

  def card
    @user = current_user
    # @credit_card = Credit_card.find(params[:id])
  end

  def identification

  end

  def list_exhibit
    @item = Item.all.order("id DESC")
    @image = ItemImage.all.order("id DESC")
  end

  def search
    @items = Item.where('name LIKE(?)', "%#{params[:keyword]}%")
    @item_count = Item.where('name LIKE(?)', "%#{params[:keyword]}%").count
    @key = params[:keyword]
  end

  def exhibit_product
    @item = Item.find(params[:id])
    @image = ItemImage.find(params[:id])
    @parents = Category.find(params[:id])
    @p = Category.find(params[:id]).item_id
    @a = Category.find_by(item_id: @p,ancestry: nil)
    @pp = Category.find_by(ancestry: nil)
    # @b = @a.find_by(ancestry: nil)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to home_list_exhibit_path
  end

  private
    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

  end
