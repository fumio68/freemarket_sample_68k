Rails.application.routes.draw do
  devise_for :users
  resources :item, only: [:index, :create, :show]
  resources :residences, only: [:create]
  root "items#index"
end
