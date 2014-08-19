class DropStudentsAndTeachers < ActiveRecord::Migration
  def change
    drop_table :students
    drop_table :teachers
  end
end
