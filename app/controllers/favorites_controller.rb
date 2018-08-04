class FavoritesController < ApplicationController
  def create
    @fav = Favorite.create(user_id: current_user.id, tweet_id: params[:tweet_id])
    @favs = Favorite.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
  end

  def destroy
    fav = Favorite.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @favs = Favorite.where(tweet_id: params[:tweet_id])
    @tweets = Tweet.all
  end
end
