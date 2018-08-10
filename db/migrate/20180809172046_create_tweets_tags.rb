class CreateTweetsTags < ActiveRecord::Migration
  def change
    create_table :tweets_tags, id: false do |t|
      t.references :tweet, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
