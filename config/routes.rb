Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  devise_for :users
  resources :items ,only: [:index, :create, :show] do
    resources :purchases, only: [:index, :create, :show]
  end
  resources :users, only: [:index, :show] 
  root "items#index"
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end