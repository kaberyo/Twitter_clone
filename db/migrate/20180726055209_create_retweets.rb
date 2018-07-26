class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|

      t.timestamps null: false
    end
  end
end
