Rails.application.routes.draw do
  devise_for :users
  resources :items do
    # resources :purchases, only: [:index, :create, :show]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
    member do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
    resources :purchases, only: [:index, :create] do
      collection do
        post 'pay'
        get 'done'
      end
    end
  end
  resources :users, only: [:show] do
    resources :residences, only: [:create, :index]
    resources :card, only: [:new, :index] do
      collection do
        post 'pay', to: 'card#pay'
        delete 'delete', to: 'card#delete'
      end
    end
  end
  root "items#index"
  
  resources :categories, only: [:index]
  
end