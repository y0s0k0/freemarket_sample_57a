class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end
end
