class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all
    @user = User.all
  end

  def new
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :media).merge(user_id: current_user.id)
  end
end
