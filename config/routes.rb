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
    get 'products/category3'  =>  'products#category'
    get 'products/category4'  =>  'products#category'
    get 'products/search'  =>  'products#search'
    resources :users, only: [:show, :edit, :update]
    resources :rooms do
    collection do
      get 'create_rooms'
    end
    member do
      get 'review'
    end
  end
end