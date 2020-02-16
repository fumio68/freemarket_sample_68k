Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index, :create, :show]
  resources :users, only: [:index, :show] 
  root "items#index"
end