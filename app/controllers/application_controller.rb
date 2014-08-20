class ApplicationController < ActionController::Base
  # TODO: add before filters, and also render json in actions
  before_filter :try_cookie_login, :require_login
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :username) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:email, :password) }
  end

  def try_cookie_login
    if not user_signed_in? and cookies.permanent.signed[:user_c]
      user_id = cookies.permanent.signed[:user_c]
      user = User.find(user_id)
      sign_in user if user
    end
  end

  def require_login
    unless user_signed_in?
      render json: {
        success: false,
        message: 'No user logged in.'
      }
    end
  end

end
