class AddColumnToNotification < ActiveRecord::Migration
 def change
   add_column :notifications, :favorite_id, :integer
   add_foreign_key :notifications, :favorites, column: :favorite_id
 end
end
