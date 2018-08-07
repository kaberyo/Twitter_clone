class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites
  has_many :retweets

  mount_uploader :media, MediaUploader
  validates :text, presence: true, length: { maximum: 140 } ,unless: :media?
end
