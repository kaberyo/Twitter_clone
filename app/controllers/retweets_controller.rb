class RetweetsController < ApplicationController
  before_action :set_tweet

  def new
    @tweets = Tweet.where(id: params[:id])
  end

  def create
  end

  def destroy
  end

  def set_tweet
    @tweet = Tweet.new
  end
end
