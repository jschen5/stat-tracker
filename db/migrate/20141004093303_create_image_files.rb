class CreateImageFiles < ActiveRecord::Migration
  def change
    create_table :image_files do |t|

      t.string :title, :null => false, :default => ""

      t.timestamps
    end
  end
end
