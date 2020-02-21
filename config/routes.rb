Rails.application.routes.draw do
  devise_for :users

  resources :items, only: [:index,:new, :create, :show] do
    resources :purchases, only: [:index, :create, :show]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:index, :show] do
    resources :residences, only: [:create, :show]
  end
  root "items#index"
end