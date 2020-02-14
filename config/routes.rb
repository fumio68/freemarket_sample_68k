Rails.application.routes.draw do
  devise_for :users
  resources :item, only: [:index, :create, :show]
  root "items#index"
end