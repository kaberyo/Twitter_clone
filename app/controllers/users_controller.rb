class UsersController < ApplicationController
  def index
     @users = User.where('name LIKE(?)', "%#{params[:keyword]}%").where.not(name: current_user.name)
     @tweet = Tweet.new
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

  private
  def user_params
    params.require(:user).permit(:name, :username ,:about, :location, :website, :avator, :cover)
  end
end
