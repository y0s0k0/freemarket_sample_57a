class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :credit_card, as: :credit_card, dependent: :destroy

  VALID_EMAIL_REGEX =                 /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # step1入力項目
  validates :nickname,                presence: true, length: {maximum: 20}
  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone
  validates :last_name,               presence: true
  validates :first_name,              presence: true
  validates :last_name_kana,          presence: true
  validates :first_name_kana,         presence: true
  validates :year,                    presence: true, numericality: true #数値のみ可
  validates :month,                   presence: true, numericality: true #数値のみ可
  validates :day,                     presence: true, numericality: true #数値のみ可

  # step2入力項目
  validates :phone_number,            presence: true, uniqueness: true, numericality: true, length: { is: 11 } #数値のみ可、11桁のみ可

  # step3入力項目
  validates :zip,                     presence: true, numericality: true, length: { is: 7 } #数値のみ可、7桁のみ可
  validates :prefecture,              presence: true
  validates :city,                    presence: true
  validates :address,                 presence: true
  validates :building,                presence: true
end
