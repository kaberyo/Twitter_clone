Rails.application.routes.draw do
  devise_for :users
  root 'tweets#index'
  get 'users/index'
  resources :users, only: [:index,:edit,:show,:update]

end
