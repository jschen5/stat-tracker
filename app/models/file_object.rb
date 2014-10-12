class FileObject < ActiveRecord::Base

  belongs_to :derived_file, :polymorphic => true
  belongs_to :user

  attr_accessible :url, :name, :size, :user_id

end
