class HomeController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @index_item = Item.all.order("id DESC").limit(10)
    @image = ItemImage.all.order("id DESC").limit(10)
    @item = Item.all
    @parents = Category.where(ancestry: nil)
  end

  def mypage
    @user = current_user
  end

  def profile
    @user = current_user
  end

  def deliver_address
    @user = current_user
  end

  def card_create
    @user = current_user
    # @credit_card = Credit_card.find(params[:id])
  end

  def card
    @user = current_user
    # @credit_card = Credit_card.find(params[:id])
  def identification
    @user = current_user
  end

  def email_password
    @user = current_user
  end

  def identification
    @user = current_user
  end

  def logout
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

  private
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
