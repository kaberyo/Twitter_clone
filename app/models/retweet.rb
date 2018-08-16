class Retweet < ActiveRecord::Base
  belongs_to :owner, class_name: "Tweet"
  belongs_to :target, class_name: "Tweet"
end
