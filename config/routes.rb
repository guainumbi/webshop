Rails.application.routes.draw do

  root 'items#index'
  get 'add_items/index'

  resources :items, only: [:index, :create, :show] do
    resources :selections, only: [:create]
  end
  resources :orders, only: :index
end
