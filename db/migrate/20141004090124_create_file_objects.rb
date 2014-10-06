class CreateFileObjects < ActiveRecord::Migration
  def change
    create_table :file_objects do |t|

      t.string :name, :null => false, :default => ""
      t.string :url, :null => false, :default => ""
      t.integer :size, :null => false, :default => 0      

      t.timestamps

    end
  end
end
