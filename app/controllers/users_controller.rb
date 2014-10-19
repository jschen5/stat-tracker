class UsersController < ApplicationController

  require 'json'

  def get_current_user
    if user_signed_in?
      render json: {
          success: true,
          user: {
            id: current_user.id,
            email: current_user.email,
            username: current_user.username,
          }
        }, :status => :ok
    else
      render :nothing => true
    end
  end

end