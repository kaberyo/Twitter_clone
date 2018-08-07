class Tweet < ActiveRecord::Base

  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :retweets
  has_many :users, through: :retweets

  mount_uploader :media, MediaUploader

  validates :text, presence: true, length: { maximum: 140 } ,unless: :media?

  def fav? (fav_user_id, fav_tweet_id)
    favorites.where(user_id: fav_user_id, tweet_id: fav_tweet_id).exists?
  end

end
