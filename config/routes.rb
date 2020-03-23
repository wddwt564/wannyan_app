Rails.application.routes.draw do
    root  'top#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
    get 'products'  =>  'products#show'
    get 'products/user_create'  =>  'products#user_create'
end