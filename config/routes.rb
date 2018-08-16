Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  get '/post/hashtag/:name', to: "tweets#hashtags"

  resources :tweets, only: [:index, :new, :create, :show] do
    resources :favorites , only: [:create, :destroy]
    collection do
      get :search
    end
    member do
      get :targets, :owners
    end
  end
  resources :users, only: [:index,:edit,:show,:update] do
    member do
      get :following, :followers, :favorites
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :retweets, only: [:new, :create, :destroy]

end
