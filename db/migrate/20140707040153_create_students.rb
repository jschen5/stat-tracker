class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|

      t.belongs_to :teacher

      t.timestamps
    end
  end
end
