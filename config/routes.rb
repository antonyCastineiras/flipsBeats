Rails.application.routes.draw do
  root 'pages#home'
  get 'pages/home'
  get '/admin' => 'pages#admin'

  devise_for :admins, controllers: { registrations: 'admins/registrations' }
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  
  resources :tracks, only: [:new, :create]
  resources :carts, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :charges
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
