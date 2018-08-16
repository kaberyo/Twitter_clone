class TweetsController < ApplicationController
  before_action :recommend_users, only: [:index, :search ,:hashtags ,:show]
  before_action :tagscount, only: [:index, :search,:hashtags]
  before_action :set_tweet, only: [:index, :search, :hashtags]

  def index
    @tweets = Tweet.where(user_id: current_user.following.ids.push(current_user.id)).reverse_order
    respond_to do |format|
      format.html # html形式でアクセスがあった場合は特に何もなし(@tweets = Tweet.allして終わり）
      format.json { @new_tweet = @tweets.where('id > ?', params[:tweet][:id]) } # json形式でアクセスがあった場合は、params[:tweet][:id]よりも大きいidがないかTweetから検索して、@new_tweetに代入する
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def new
    @parent_id = params[:parent_id]
  end

  def create
    @tweet = Tweet.create(tweet_params)
    if tweet_params[:parent_id].present?
      redirect_to tweet_path(id: tweet_params[:parent_id])
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js
      end
    end
  end

  def search
    @tweets = Tweet.where('text LIKE(?)',"%#{params[:keyword]}%")
    @tag =""
  end

  def hashtags
    @tag = Tag.find_by(name: params[:name])
    @tweets = @tag.tweets.order("created_at DESC").limit(10)
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text, :media, :parent_id).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.new
  end
end
