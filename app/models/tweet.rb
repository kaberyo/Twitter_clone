class Tweet < ActiveRecord::Base

  belongs_to :user
  has_many :favorites
  # has_many :users, through: :favorites
  has_many :retweets
  # has_many :users, through: :retweets

  mount_uploader :media, MediaUploader

end
