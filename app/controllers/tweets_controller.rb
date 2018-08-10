class TweetsController < ApplicationController
  before_action :set_tweet, only: [:index, :search, :hashtags]

  def index
    @tweets = Tweet.where(user_id: current_user.following.ids.push(current_user.id)).reverse_order
    @user = User.all
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @parent_id = params[:parent_id]
  end

  def create
    Tweet.create(tweet_params)
    if tweet_params[:parent_id].present?
      redirect_to tweet_path(id: tweet_params[:parent_id])
    else
      redirect_to root_path
    end
  end

  def search
    @tweets = Tweet.where('text LIKE(?)',"%#{params[:keyword]}%")
    @tag =""
  end

  def hashtags
    @tag = Tag.find_by(name: params[:name])
    @tweets = @tag.tweets.order("created_at DESC")
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :media, :parent_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.new
  end
end
