Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :create, :show]
  resources :users, only: [:show]
  root "items#index"
end