class SignupController < ApplicationController
  # before_action :set_credit_card, only: :step4
  # 各アクションごとに新規インスタンスを作成
  # 各アクションごとに、遷移元のページのデータをsessionに保管
  
  def index

  end
  
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:last_name] = user_params[:last_name]
    session[:first_name] = user_params[:first_name]
    session[:last_name_kana] = user_params[:last_name_kana]
    session[:first_name_kana] = user_params[:first_name_kana]
    session[:year] = user_params[:year]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成

  end

  def step4
    # step3で入力された値をsessionに保存
    # session[:zip] = user_params[:zip]
    # session[:prefecture] = user_params[:prefecture]
    # session[:city] = user_params[:city]
    # session[:address] = user_params[:address]
    # session[:building] = user_params[:building]
    # @user = User.new # 新規インスタンス作成
    # @user = @credit_card.user.
  end

  def done
    # sign_in User.find(session[:user_id]) unless user_signed_in?
  end

  def create
    @user = User.new(
      nickname: session[:nickname], # sessionに保存された値をインスタンスに渡す
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation],
      last_name: session[:last_name], 
      first_name: session[:first_name], 
      last_name_kana: session[:last_name_kana], 
      first_name_kana: session[:first_name_kana], 
      year: session[:year],
      month: session[:month],
      day: session[:day],
      phone_number: session[:phone_number],
      zip: session[:zip],
      prefecture: session[:prefecture],
      city: session[:city],
      address: session[:address],
      building: session[:building],
    )
    if @user.save
      # ログインするための情報を保管
        session[:user_id] = @user.id
        redirect_to done_signup_index_path
    else
      render '/signup/registration'
    end
  end  

  private
    # 許可するキーを設定
  def user_params
    params.require(:user).permit(
      :nickname, 
      :email, 
      :password, 
      :password_confirmation, 
      :last_name, 
      :first_name, 
      :last_name_kana, 
      :first_name_kana, 
      :year,
      :month,
      :day,
      :phone_number,
      :zip,
      :prefecture, 
      :city,
      :address,
      :building, 
      :image,
      :introduction, 
    )
    # .merge(card_number: params[:card_number])
  end

  # def set_credit_card
  #   @credit_card = Credit_card.find(params[:card_number])
  # end
end
