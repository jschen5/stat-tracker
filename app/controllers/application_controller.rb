class ApplicationController < ActionController::Base

  # respond_to :html, :json
  # protect_from_forgery

  # TODO: add before filters, and also render json in actions
  # before_filter :try_cookie_login, :require_login
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

end
