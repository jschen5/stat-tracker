class AddUserIdToFileObjects < ActiveRecord::Migration
  def change
    add_column :file_objects, :user_id, :integer
  end
end
