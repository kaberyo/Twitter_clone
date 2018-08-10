class UsersController < ApplicationController
  before_action :user_followers_count
  def index
     @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(name: current_user.name)
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
    medias = []
    @user = User.find(params[:id])
    @users = current_user.following & @user.followers
    @tweets = @user.tweets
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

  def user_followers_count
    users = User.all
    users.each do |user|
      user.followers_count = user.followers.count
      user.save
    end
    binding.pry
    number = User.all.ids - [current_user.id]
    candidates = []
    number.each do |num|
      candidate = User.find(num)
      candidates << candidate
    end
    @recommends = User.order("followers_count DESC").limit(3)
    @recommends = candidates.order("followers_count DESC").limit(3)
  end

  private
  def user_params
    params.require(:user).permit(:name, :username ,:about, :location, :website, :avator, :cover)
  end
end
