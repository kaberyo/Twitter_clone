class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :tweet,       null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
