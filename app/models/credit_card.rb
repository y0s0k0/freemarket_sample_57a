class CreditCard < ApplicationRecord
  has_one :user, as: :user, dependent: :destroy
end
