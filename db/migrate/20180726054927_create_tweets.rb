class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.string :text,           null: false, limit: 140
      t.references :user,       null: false, foreign_key: true
      t.string :lcation
      t.string :media
      t.integer :parent_id

      t.timestamps null: false
    end
  end
end
