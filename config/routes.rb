Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/mypage'  => 'home#mypage'
  get 'home/profile' => 'home#profile'
  get 'home/logout'  => 'home#logout'
  get 'home/identification'  => 'home#identification'
  get 'home/list_exhibit' => 'home#list_exhibit'
  resources :items,  only: [:new, :create, :edit, :update, :show]
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
