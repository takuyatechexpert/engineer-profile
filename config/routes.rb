Rails.application.routes.draw do
# devise_for :users

devise_for :users, controllers: {
  registrations: 'users/registrations'
}

root "profiles#index"

  resources :posts, only: [:new, :create, :update, :destroy, :edit]
  resources :follows, only: :index
  resources :followers, only: :index
  resources :users, only: [:edit, :update, :show]
  resources :profiles, only: :index do
    collection{ get "search" }
  end
  resources :relationships, only: [:create, :destroy]

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
