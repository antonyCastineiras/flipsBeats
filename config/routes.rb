Rails.application.routes.draw do
  get 'pages/home'

  devise_for :admins, controllers: { registrations: 'admins/registrations' }
  resources :tracks, only: [:new, :create]
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
