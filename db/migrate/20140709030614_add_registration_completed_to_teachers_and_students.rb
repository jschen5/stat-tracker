class AddRegistrationCompletedToTeachersAndStudents < ActiveRecord::Migration
  def change
    add_column :teachers, :registration_complete, :boolean, default: false
    add_column :students, :registration_complete, :boolean, default: false
  end
end
