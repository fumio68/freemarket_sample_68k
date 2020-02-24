Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index,:new, :create, :show] do
    resources :purchases, only: [:index, :create, :show] do
      collection do
        get 'get_purchase_modify'
        post 'post_purchase_modify'
      end
    end
  end
  resources :users, only: [:index, :show] do
    resources :residences, only: [:create, :index]
  end
  root "items#index"
  resources :categories, only: [:index]
  
end