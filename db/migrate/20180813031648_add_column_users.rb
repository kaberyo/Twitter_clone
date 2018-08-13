class AddColumnUsers < ActiveRecord::Migration
  def change
    add_column :users, :favorited_count, :integer , default: "0"
  end
end
