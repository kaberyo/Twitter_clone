class RetweetsController < ApplicationController
  before_action :set_tweet

  def new
    @tweets = Tweet.where(id: params[:id])
  end

  def create
    @tweet = Tweet.create(retweet_params)
    @tweet.save
    tweet = Tweet.find(params.require(:tweet).permit(:parent_id).fetch("parent_id"))
    @tweet.retweet(tweet)
    redirect_to root_path
  end

  def destroy
    @tweet = Retweet.find(params[:id]).targets
    tweet =
    tweet.unretweet(@tweet)
    redirect_to root_path
  end

  private

  def set_tweet
    @tweet = Tweet.new
  end

  def retweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end
end
