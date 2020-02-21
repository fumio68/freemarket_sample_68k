Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index,:new, :create, :show] do
    resources :purchases, only: [:index, :create, :show]
  end
  resources :users, only: [:index, :show] do
    resources :residences, only: [:create, :show]
  end
  root "items#index"
  resources :categories, only: [:index]
  get 'items/:item_id/purchases/:id/completed', to: 'purchases#show'
end