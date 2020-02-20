Rails.application.routes.draw do
  devise_for :users
  resources :items ,only: [:index, :create, :show] do
    resources :purchases, only: [:index, :create, :show]
  end
  resources :users, only: [:index, :show] 
  root "items#index"
end