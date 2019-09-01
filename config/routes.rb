Rails.application.routes.draw do
  root 'home#index'
  get 'home/mypage'  => 'home#mypage'
  get 'home/profile' => 'home#profile'
  get 'home/logout'  => 'home#logout'
end
