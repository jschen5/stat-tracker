class FileObject < ActiveRecord::Base

  belongs_to :derived_file, :polymorphic => true

  attr_accessible :url, :name, :size

end
