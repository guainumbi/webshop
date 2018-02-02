Rails.application.routes.draw do

  get 'add_items/index'

  resources :items, only: [:index, :create]
  resources :orders, only: :index

end
