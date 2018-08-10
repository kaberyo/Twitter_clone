class TweetsController < ApplicationController
  before_action :tagscount

  def index
    @tweet = Tweet.new
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
    @tag =""
  end

  def hashtags
    @tag = Tag.find_by(name: params[:name])
    @tweets = @tag.tweets.order("created_at DESC")
  end

  def tagscount
    tags = Tag.all
    tags.each do |tag|
      tag.tags_count = tag.tweets.count
      tag.save
    end
    @trend = Tag.order("tags_count DESC")
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :media, :parent_id).merge(user_id: current_user.id)
  end
end
