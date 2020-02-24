Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index,:new, :create, :show] do
    resources :purchases, only: [:index, :create, :show]
  end
  resources :users, only: [:index, :show] do
    resources :residences, only: [:create, :show]
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