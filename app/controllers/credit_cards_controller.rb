class CreditCardsController < ApplicationController
  private

  def credit_card_params
    params.require(:user).permit(:card_number)
  end
end
