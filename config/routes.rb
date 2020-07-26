Rails.application.routes.draw do
  get 'rooms/new'
    root  'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
    get 'products'  =>  'products#show'
    get 'products/user_create'  =>  'products#user_create'
    get 'products/category_dog'  =>  'products#category_dog'
    get 'products/category_cat'  =>  'products#category_cat'
    get 'products/category_rabbit'  =>  'products#category_rabbit'
    get 'products/category_other'  =>  'products#category_other'
    get 'products/search'  =>  'products#search'
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :rooms do
    resources :comments, only: [:create]
    collection do
      get 'create_rooms'
    end
    member do
      get 'review'
    end
  end
  resources :comments, only: [:destroy]
end