Rails.application.routes.draw do
  get 'users/show'
devise_for :users
 root 'home#index'
 resources :users, only: :show
 resources :items do
end
end
