Rails.application.routes.draw do

  resources :items, only: :index
  resources :orders, only: :index

end
