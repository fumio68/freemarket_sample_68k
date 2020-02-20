Rails.application.routes.draw do
  devise_for :users

  resources :items, only: [:index,:new, :create, :show] do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  resources :users, only: [:index, :show] 
  root "items#index"
end