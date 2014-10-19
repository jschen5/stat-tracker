class ApplicationController < ActionController::Base

  require 'json'
  require 'uri'

  # protect_from_forgery

  # TODO: add before filters, and also render json in actions
  before_filter :try_cookie_login
  before_action :configure_permitted_parameters, if: :devise_controller?

  # after_filter :set_csrf_cookie_for_ng
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  end

  def try_cookie_login
    user_id = cookies.signed[:user_c]
    if !user_id.nil?
      user = User.find(user_id)
      sign_in user
    end
  end

  def require_login
    unless user_signed_in?
      render :nothing => true, :status => :unauthorized
    end
  end

end
