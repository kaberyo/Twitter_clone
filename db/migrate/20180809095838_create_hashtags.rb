class CreateHashtags < ActiveRecord::Migration
  def change
    create_table :hashtags do |t|
      t.string :hashname
      t.timestamps null: false
    end
    add_index :hashtags, :hashname, unique: true
  end
end
