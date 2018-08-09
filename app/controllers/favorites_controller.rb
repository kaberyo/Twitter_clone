class FavoritesController < ApplicationController
  def create
    tweet = Tweet.find(params[:tweet_id])
    tweet.favorites.create(user_id: current_user.id)
    redirect_to (:back)
  end

  def destroy
    Favorite.find_by(user_id: params[:id], tweet_id: params[:tweet_id]).delete
    redirect_to (:back)
  end
end
