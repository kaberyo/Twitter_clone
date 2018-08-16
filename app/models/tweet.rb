class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :tweets_tags
  has_many :tags, through: :tweets_tags
  has_many :notifications, dependent: :destroy

  has_many :active_retweets, class_name: "Retweet", foreign_key: "owner_id", dependent: :destroy
  has_many :passive_retweets, class_name: "Retweet", foreign_key: "target_id", dependent: :destroy
  has_many :targets, through: :active_retweets, source: :target
  has_many :owners, through: :active_retweets, source: :owner

  mount_uploader :media, MediaUploader
  validates :text, presence: true, length: { maximum: 140 } ,unless: :media?

  def fav? (fav_user_id, fav_tweet_id)
    favorites.where(user_id: fav_user_id, tweet_id: fav_tweet_id).exists?
  end

  def retweet(other_tweet)
    active_retweets.create(target_id: other_tweet.id)
  end

  def unretweet(other_tweet)
    active_retweets.create(target_id: other_tweet.id).destroy
  end

  def retweet?(other_tweet)
    targets.include?(other_tweet)
  end

  after_create do
    tweet = Tweet.find_by(id: self.id)
    hashtags  = self.text.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Tag.find_or_create_by(name: hashtag.downcase.delete('#'))
      tweet.tags << tag
    end
  end
end
