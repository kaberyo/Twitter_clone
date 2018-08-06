class FavoritesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    tweet.favorites.create(user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    tweet_fav = Favorite.find_by(tweet_id: params[:tweet_id])
    tweet_fav.delete
    redirect_to root_path
  end
end
