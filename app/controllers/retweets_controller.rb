class RetweetsController < ApplicationController
  before_action :set_tweet

  def new
    @tweets = Tweet.where(id: params[:id])
  end

  def create
    @tweet = Tweet.create(retweet_params)
    if @tweet.save
      tweet = Tweet.find(params.require(:tweet).permit(:parent_id).fetch("parent_id"))
      @tweet.retweet(tweet)
      redirect_to root_path
    else
      redirect_to (:back)
    end
  end

  def destroy
  end

  private

  def set_tweet
    @tweet = Tweet.new
  end

  def retweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end
end
