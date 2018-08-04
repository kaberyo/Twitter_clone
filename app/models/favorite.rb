class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :tweet, counter_cache: :fav_count
end
