class UsersController < ApplicationController

  require 'json'

  def get_current_user
    puts user_signed_in?
    if user_signed_in?
      render json: {
        success: true,
        user: {
          id: current_user.id,
          email: current_user.email,
          username: current_user.username,
        }
      }
    else
      render json: {
        success: false
      }
    end
  end

end