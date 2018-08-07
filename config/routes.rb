Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  resources :tweets, only: [:index, :new, :create] do
    resources :favorites , only: [:create, :destroy]
  end


  resources :users, only: [:index,:edit,:show,:update] do
    member do
      get :following, :followers, :favorites
    end
  end

  resources :relationships, only: [:create, :destroy]

end
