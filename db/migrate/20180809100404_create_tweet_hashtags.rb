class CreateTweetHashtags < ActiveRecord::Migration
  def change
    create_table :tweets_hashtags do |t|
      t.references :tweet, index: true, foreign_key: true
      t.references :hashtag, index: true, foreign_key: true
    end
  end
end
