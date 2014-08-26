class UsersController < ApplicationController

  require 'json'

  def create
    user = User.new(params)
    user.save
    UserMailer.sign_up_confirmation(user, params[:type])
  end

  def set_complete
    user = User.find(params[:id])
    user.set_registration_complete
    # redirect to home page or registration success page
    redirect_to :home=>'home'
  end

  def login
    user = User.find_by_email(params[:email])
    if user.nil?
      render json: {success: false, message: 'User with email "#{params[:email]}" does not exist.'}
    elsif !user.registration_complete
      #eventually check if registration link on email still valid (ie. not yet expired)
      render json: {success: false, message: 'Please click the link on the registration email.'}
    else
      auth = authenticate(user, params[:password])
      if !auth
        render json: {success: false, message: 'Incorrect password.'}
      else
        sign_in user
        cookies.permanent.signed[:user_c] = user.id
        render json: {
          success: auth,
          message: 'You are now logged in as #{user.username}.',
          name: user.username,
          email: user.email
        }
      end
    end
  end

  def authenticate(user, password)
    user.valid_password?(password)
  end

end