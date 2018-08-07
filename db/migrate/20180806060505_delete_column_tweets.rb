class DeleteColumnTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :fav_count, :string
  end
end
