Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'

  resources :products
  resources :destinations, only: [:index, :create, :new]
end
