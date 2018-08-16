Rails.application.routes.draw do
  get 'notifications/link_through'

  devise_for :users
  root "tweets#index"
  get '/post/hashtag/:name', to: "tweets#hashtags"
  get 'notifications/:id/link_through', to: 'notifications#link_through',as: :link_through

  resources :tweets, only: [:index, :new, :create, :show] do
    resources :favorites , only: [:create, :destroy]
    collection do
      get :search
    end
  end
  resources :users, only: [:index,:edit,:show,:update] do
    member do
      get :following, :followers, :favorites
    end
  end
  resources :relationships, only: [:create, :destroy]

end
