Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/mypage'  => 'home#mypage'
  get 'home/profile' => 'home#profile'
  get 'home/deliver_address'  => 'home#deliver_address'
  get 'home/logout'  => 'home#logout'
  get 'home/identification' => 'home#identification'
  get 'home/email_password' => 'home#email_password'
  get 'home/list_exhibit' => 'home#list_exhibit'
  get 'home/search' => 'home#search'
  get 'home/exhibit_product/:id' => 'home#exhibit_product'
<<<<<<< HEAD
  get 'home/card_create'  => 'home#card_create'
  get 'items/exhibit_product/:id' => 'itmes#exhibit_product'
=======
>>>>>>> parent of ae4246c... Merge pull request #29 from y0s0k0/category#2
  get 'home/card'  => 'home#card'
  delete  'home/:id'  => 'home#destroy'
  get 'items/category' => 'items#category'
  resources :items, only: [:new, :create, :edit, :update, :show] do
    resources :item_image, only: :create
    collection do
      get "get_category_children", defaults: {format: "json"}
      get "get_category_grandchildren", defaults: {format: "json"}
    end
  end
  resources :purchase, only: [:new, :create]
  devise_for :users 
  get '/signup' => 'signup#index'
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3' # ここで 入力の全てが終了
      get 'done' # 登録完了後のページに遷移
    end
  end
  resources :credit_cards, only: :new
end
