class StoriesController < ApplicationController

  before_filter :require_login, :only => [:create]

  def create
    file_obj = params[:file]
    ImageFile.create({
      :data => file_obj.tempfile.read,
      :name => file_obj.original_filename,
      :size => file_obj.tempfile.size,
      :user_id => current_user.id
    })
    file_obj.tempfile.unlink
    render json: {
      success: true
    }
  end

end
