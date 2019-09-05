class HomeController < ApplicationController
  def index
    @index_item = Item.all.limit(10)
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
end
