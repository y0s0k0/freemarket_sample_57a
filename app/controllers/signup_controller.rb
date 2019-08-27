class SignupController < ApplicationController
  # 各アクションごとに新規インスタンスを作成
　# 各アクションごとに、遷移元のページのデータをsessionに保管
  def step1
    @user = User.new # 新規インスタンス作成
  end

  def step2
    # step1で入力された値をsessionに保存
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new # 新規インスタンス作成
  end

  def step3
    # step2で入力された値をsessionに保存
    session[:phone_number] = user_params[:phone_number]
    @user = User.new # 新規インスタンス作成
  end

  def step4
    # step3で入力された値をsessionに保存
  
    @user = User.new # 新規インスタンス作成
  end

  def done
    # step4で入力された値をsessionに保存
    
    @user = User.new # 新規インスタンス作成
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
    end
end
