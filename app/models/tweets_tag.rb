class TweetsTag < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :tag
end
