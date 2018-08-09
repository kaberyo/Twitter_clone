class Hashtag < ActiveRecord::Base
  validates :hashname, presence: true, length: {maximum:99}
  has_and_belongs_to_many :tweets
end
