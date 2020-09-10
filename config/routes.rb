Rails.application.routes.draw do
  get 'users/show'
devise_for :users
 
 resources :users, only: [:show]
 resources :rental, only: [:index,:show]
 resources :items do
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
  resources :transaction, only:[:index, :create]
 end

 root 'home#index'

end

