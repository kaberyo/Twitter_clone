class RenameColumnToRelationships < ActiveRecord::Migration
  def change
    rename_column :relationships, :user_id, :following_id
    rename_column :relationships, :tweet_id, :follower_id
  end
end
