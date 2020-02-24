Rails.application.routes.draw do
  devise_for :users
  resources :items, only: [:index,:new, :create, :show] do
    resources :purchases, only: [:index, :create, :show] do
      member do
        get :done
      end
    end
  end
  resources :users, only: [:index, :show] do
    resources :residences, only: [:create, :show]
  end
  root "items#index"
  resources :categories, only: [:index]
end