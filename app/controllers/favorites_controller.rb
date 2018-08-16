class FavoritesController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.favorites.create(user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js
    end
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    Favorite.find_by(user_id: params[:id], tweet_id: params[:tweet_id]).delete
    respond_to do |format|
      format.html { redirect_to (:back) }
      format.js
    end
  end
end
