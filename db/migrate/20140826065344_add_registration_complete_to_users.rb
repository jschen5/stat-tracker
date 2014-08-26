class AddRegistrationCompleteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :registration_complete, :boolean
  end
end
