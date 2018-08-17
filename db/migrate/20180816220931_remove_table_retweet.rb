class RemoveTableRetweet < ActiveRecord::Migration
  def change
    remove_foreign_key :retweets, :users
    remove_reference :retweets, :user
    remove_foreign_key :retweets, :tweets
    remove_reference :retweets, :tweet

    add_column :retweets, :owner_id, :integer
    add_column :retweets, :target_id, :integer

    add_foreign_key :retweets, :tweets, column: :owner_id
    add_foreign_key :retweets, :tweets, column: :target_id

    add_index :retweets, [:owner_id, :target_id], unique: true
  end
end
