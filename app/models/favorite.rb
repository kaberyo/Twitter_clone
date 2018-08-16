class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet
  has_many :notifications, dependent: :destroy
end
