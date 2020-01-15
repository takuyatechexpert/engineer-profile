Rails.application.routes.draw do
devise_for :users
root "profiles#index"

  resources :profiles, only: :index
  resources :users, only: [:edit, :update]
  resources :relationships, only: [:create, :destroy]
end
