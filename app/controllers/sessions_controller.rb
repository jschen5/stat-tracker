# app/controllers/sessions_controller.rb
class SessionsController < Devise::SessionsController
  # POST /resource/sign_in
  def create
    super
    if !cookies.signed[:user_c] and params[:user][:remember] and user_signed_in?
      cookies.signed[:user_c] = { value: current_user.id, expires: 90.days.from_now }
    end
  end

  # GET /resource/sign_out
  def destroy
    super
    cookies.signed[:user_c] = nil
  end
end