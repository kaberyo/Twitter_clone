class Tweet < ActiveRecord::Base

  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :retweets

  mount_uploader :media, MediaUploader

  def fav_user(user_id)
    favs.find_by(user_id: user_id)
  end
end
