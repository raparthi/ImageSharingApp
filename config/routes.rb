Rails.application.routes.draw do
  devise_for :users
  root 'home#show'

  resource :dashboard, controller: :dashboard
  resources :users

  resources :albums do
    resources :photos
  end
end
