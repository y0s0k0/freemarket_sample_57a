class CreditCardsController < ApplicationController
  private

  def step4
    @credit_card = Credit_card.new
  end

  def credit_card_params
    params.require(:user).permit(:card_number)
  end

end
