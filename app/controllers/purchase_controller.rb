class PurchaseController < ApplicationController
  
  def edit
    @user = User.find_by(id: current_user.id)
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(transaction_condition: 2, buyer_id: current_user.id)
      redirect_to root_path
    else
      redirect_to edit_path
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :price).merge(set_during_trading).merge(buyer_id: current_user.id)
  end

  def set_during_trading
    {transaction_condition: 2}
  end

end
