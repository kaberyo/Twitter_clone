Rails.application.routes.draw do
  get 'notifications/link_through'

  devise_for :users
  root "tweets#index"
  get '/post/hashtag/:name', to: "tweets#hashtags"
  get 'notifications/:id/link_through', to: 'notifications#link_through',as: :link_through

  resources :tweets, only: [:index, :new, :create, :destroy, :show] do
    resources :favorites , only: [:create, :destroy]
    collection do
      get :search,:moment
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
