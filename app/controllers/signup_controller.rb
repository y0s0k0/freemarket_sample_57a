class SignupController < ApplicationController
  # 各アクションごとに新規インスタンスを作成
  # 各アクションごとに、遷移元のページのデータをsessionに保管
  before_action :validates_step1, only: :step2 # step1のバリデーション
  before_action :validates_step2, only: :step3 # step2のバリデーション
  before_action :validates_step3, only: :create # step3のバリデーション

  def index

  end

  def show

  end

  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    @user = User.new # 新規インスタンス作成
  end

  def step3
    @user = User.new # 新規インスタンス作成
  end

  def create
    # step3で入力された値をsessionに保存
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
      building: session[:building]
    )
    if @user.save
      # ログインするための情報を保管
        session[:user_id] = @user.id
        redirect_to done_signup_index_path
    else
      render '/signup/step1'
    end
  end  

  def done
    sign_in User.find(session[:user_id]) unless user_signed_in?
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
      :building
    )
    # .merge(card_number: params[:card_number])
  end



  def validates_step1
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
    session[:month] = user_params[:month]
    session[:day] = user_params[:day]
    # バリデーション用に、仮でインスタンスを作成する
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
      phone_number: "08087654321", # 入力前の情報は、バリデーションに通る値を仮で入れる
      zip: "1234567",
      prefecture: "愛知県",
      city: "一宮市神山",
      address: "7丁目14",
      building: "ハイツアーバン115"
    )
    # 仮で作成したインスタンスのバリデーションチェックを行う
  render '/signup/step1' unless @user.valid?(:validates_step1)
  end

  def validates_step2
  # step2で入力された値をsessionに保存
  session[:phone_number] = user_params[:phone_number]
  # バリデーション用に、仮でインスタンスを作成する
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
    zip: "1234567", # 入力前の情報は、バリデーションに通る値を仮で入れる
    prefecture: "愛知県",
    city: "一宮市神山",
    address: "7丁目14",
    building: "ハイツアーバン115"
  )
  # 仮で作成したインスタンスのバリデーションチェックを行う
  render '/signup/step2' unless @user.valid?(:validates_step2)
  end

  def validates_step3
  # step3で入力された値をsessionに保存
  session[:zip] = user_params[:zip]
  session[:prefecture] = user_params[:prefecture]
  session[:city] = user_params[:city]
  session[:address] = user_params[:address]
  session[:building] = user_params[:building]
  # バリデーション用に、仮でインスタンスを作成する
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
    building: session[:building]
  )
  # 仮で作成したインスタンスのバリデーションチェックを行う
  render '/signup/step3' unless @user.valid?(:validates_step3)
  end

  def error_messages
  end


  # def set_credit_card
  #   @credit_card = Credit_card.find(params[:card_number])
  # end
end
