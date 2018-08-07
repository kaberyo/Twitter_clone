class AddCountTweets < ActiveRecord::Migration
  def change
    add_column :tweets, :fav_count, :integer
  end
end
