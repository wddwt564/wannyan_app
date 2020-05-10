Rails.application.routes.draw do
  get 'rooms/new'
    root  'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
    get 'products'  =>  'products#show'
    get 'products/user_create'  =>  'products#user_create'
    resources :users, only: [:show, :edit, :update]
    resources :rooms, only: [:new, :show, :create]
    get 'rooms/create_rooms' =>  'rooms#create_rooms'
    
end