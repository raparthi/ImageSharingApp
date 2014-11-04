Rails.application.routes.draw do
  devise_for :users
  root 'home#show'

  resource :dashboard, controller: :dashboard
  resources :albums
  resources :photos
end
