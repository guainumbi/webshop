Rails.application.routes.draw do

  root 'items#index'
  get 'add_items/index'

  resources :items, only: [:index, :create, :show] do
    resources :selections, only: [:create, :destroy] do
      delete 'destroy_all' => 'selections#destroy_all_for_item', on: :collection
    end
  end
  resources :orders, only: :index
end
