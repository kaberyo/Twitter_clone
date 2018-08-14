class UsersController < ApplicationController
  before_action :recommend_users, only: [:index, :show, :favorites,:followers,:following]
  before_action :tagscount, only: [:index, :show, :favorites,:followers,:following]
  before_action :set_tweet

  def index
    @users = User.where('username LIKE(?)', "%#{params[:keyword]}%").where.not(name: current_user.name)
    respond_to do |format|
      format.html
      format.json
    end
    @tag = ""
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @users = current_user.following & @user.followers
    @tweets = @user.tweets.reverse_order
    tweet_medias = []
    @tweets.each do |tweet|
      if tweet.media.present? #compactでなくifで条件分岐
        tweet_medias << tweet
      end
    end
    @tweet_medias = tweet_medias
  end

  def favorites
    @user = User.find(params[:id])
    @users = current_user.following & @user.followers

    tweets = @user.tweets.reverse_order
    tweet_medias = []
    tweets.each do |tweet|
      if tweet.media.present? #compactでなくifで条件分岐
        tweet_medias << tweet
      end
    end
    @tweet_medias = tweet_medias

    add_tweets = []
    @favorites = Favorite.where(user_id: @user.id)
    @favorites.each do |favorite|
      id = favorite.tweet_id
      tweet = Tweet.find(id)
      add_tweets << tweet
    end
    @tweets = add_tweets
  end

  def following
    @user  = User.find(params[:id])
    @following = @user.following
    @users = current_user.following & @user.followers
    tweets = @user.tweets.reverse_order
    tweet_medias = []
    tweets.each do |tweet|
      if tweet.media.present? #compactでなくifで条件分岐
        tweet_medias << tweet
      end
    end
    @tweet_medias = tweet_medias
  end

  def followers
    @user  = User.find(params[:id])
    @followers = @user.followers
    @users = current_user.following & @user.followers
    tweets = @user.tweets.reverse_order
    tweet_medias = []
    tweets.each do |tweet|
      if tweet.media.present? #compactでなくifで条件分岐
        tweet_medias << tweet
      end
    end
    @tweet_medias = tweet_medias
  end

  private
  def user_params
    params.require(:user).permit(:name, :username ,:about, :location, :website, :avator, :cover)
  end

  def set_tweet
    @tweet = Tweet.new
  end
end
