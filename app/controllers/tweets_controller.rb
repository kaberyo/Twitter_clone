class TweetsController < ApplicationController
  before_action :user_followers_count,only: [:index, :new, :search]
  def index
    @tweets = Tweet.where(user_id: current_user.following.ids.push(current_user.id)).reverse_order
    @user = User.all
  end

  def new
    @tweet = Tweet.new
    @parent_id = params[:parent_id]
  end

  def create
    Tweet.create(tweet_params)
    redirect_to root_path
  end

  def search
    @tweets = Tweet.where('text LIKE(?)',"%#{params[:keyword]}%")
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :media, :parent_id).merge(user_id: current_user.id)
  end
end
