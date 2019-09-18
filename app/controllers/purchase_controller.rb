class PurchaseController < ApplicationController
  
  def edit
    @user = User.find_by(id: current_user_id)
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id]).merge(set_during_trading)
    if @item.save
      redirect_to home_mypage_path
    else
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :price,
      item_images_attributes:[:item_id, :image]).merge(buyer_id: current_user.id)
  end

  def set_during_trading
    {transaction_condition: 2}
  end

end
