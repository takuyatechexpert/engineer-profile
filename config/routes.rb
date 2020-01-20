Rails.application.routes.draw do
devise_for :users
root "profiles#index"

  resources :follows, only: :index
  resources :followers, only: :index
  resources :users, only: [:edit, :update, :show]
  resources :profiles, only: :index do
    collection{ get "search" }
  end
  resources :relationships, only: [:create, :destroy]
end
