class RenameColumnToRetweet < ActiveRecord::Migration
  def change
    rename_column :retweets, :user_id, :owner_id
    rename_column :retweets, :tweet_id, :target_id

    add_index :retweets, [:owner_id, :target_id], unique: true
  end
end
