class UsersController < ApplicationController
   before_action :user_followers_count,only: [:index, :show, :favorites,:followers,:following]
  before_action :set_tweet

  def index
     @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(name: current_user.name)
     @tag = ""
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to userpath
    else
      render :edit
    end
  end

  def show
    medias = []
    @user = User.find(params[:id])
    @users = current_user.following & @user.followers
    @tweets = @user.tweets.reverse_order
    @tweets.each do |tweet|
      media = tweet.media.url
      medias << media
    end
    @medias = medias.compact.reject(&:empty?)
  end

  def favorites
    tweets = []
    @user = User.find(params[:id])
    @favorites = Favorite.where(user_id: @user.id)
    @favorites.each do |favorite|
      id = favorite.tweet_id
      tweet = Tweet.find(id)
      tweets << tweet
    end
    @tweets = tweets
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.following
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end

  private
  def user_params
    params.require(:user).permit(:name, :username ,:about, :location, :website, :avator, :cover)
  end

  def set_tweet
    @tweet = Tweet.new
  end
end
