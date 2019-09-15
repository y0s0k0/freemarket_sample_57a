Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'home/mypage'  => 'home#mypage'
  get 'home/profile' => 'home#profile'
  get 'home/logout'  => 'home#logout'
  get 'home/identification' => 'home#identification'
  get 'home/list_exhibit' => 'home#list_exhibit'
  get 'home/search' => 'home#search'
  get 'home/exhibit_product/:id' => 'home#exhibit_product'
  get 'home/card'  => 'home#card'
  delete  'home/:id'  => 'home#destroy'
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
  get '/login' => 'login#index'
  resources :signup do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで 入力の全てが終了
      get 'done' # 登録完了後のページに遷移
    end
  end
  resources :credit_cards, only: :new
end
