class Retweet < ActiveRecord::Base
  belongs_to :owner, calss_name "Tweet"
  belongs_to :target, calss_name "Tweet"

  def retweet(other_tweet)
    active_retweets.create(target_id: other_tweet.id)
  end

  def unretweet(other_tweet)
    active_retweets.create(target_id: other_tweet.id),destroy
  end

  def retweet?(other_tweet)
    targets.include?(other_tweet)
  end
end
