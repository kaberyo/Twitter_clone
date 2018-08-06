class Relationship < ActiveRecord::Migration
  def change
    add_index :relationships, [:follower_id, :following_id], unique: true
  end
end
