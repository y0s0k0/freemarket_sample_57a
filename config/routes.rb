Rails.application.routes.draw do
  devise_for :users 
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで 入力の全てが終了
      get 'done' # 登録完了後のページに遷移
    end
  end
end
