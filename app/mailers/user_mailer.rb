class UserMailer < ActionMailer::Base
  default from: "admin@vivace.com"

  def sign_up_confirmation(user)
    sign_up_token = Digest::SHA1.hexdigest([Time.now, rand].join)
    @user = user
    @url = "http://localhost:8000/users/#{@user.id}/#{sign_up_token}"
    mail(to: @user.email, subject: "Welcome to Vivace.com!", from: "vivace@vivace.com")
  end
end
