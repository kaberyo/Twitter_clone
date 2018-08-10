class Tag < ActiveRecord::Base
  has_many :tweets_tags
  has_many :tweets, through: :tweets_tags
end
