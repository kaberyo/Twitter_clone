class TweetHashtag < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :Hashtag
  validates  :tweet_id, presence: true
  validates  :hashtag_id,   presence: true
end
