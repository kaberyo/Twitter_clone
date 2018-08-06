Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  resources :users, only: [:index,:edit,:show,:update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :tweets, only: [:index, :new, :create]
end
