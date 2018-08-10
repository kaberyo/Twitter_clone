class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :users, through: :favorites
  has_many :retweets
  has_many :users, through: :retweets
  has_many :tweets_tags
  has_many :tags, through: :tweets_tags


  mount_uploader :media, MediaUploader
  validates :text, presence: true, length: { maximum: 140 } ,unless: :media?

  def fav? (fav_user_id, fav_tweet_id)
    favorites.where(user_id: fav_user_id, tweet_id: fav_tweet_id).exists?
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
