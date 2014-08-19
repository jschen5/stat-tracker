class UserController < ApplicationController

  def create
    if params[:type] == 'teacher'
      redirect_to :controller=>'teachers', :action=>'create', :email=>params[:email], :password=>params[:password]
    else
      redirect_to :controller=>'students', :action=>'create', :email=>params[:email], :password=>params[:password]
    end
  end

  def set_complete
    if params[:type] == 'teacher'
      user = Teacher.find(params[:user])
    else
      user = Student.find(params[:user])
    end
    user.set_registration_complete
    # redirect to home page or registration success page
    redirect_to :home=>'home'
  end

  def login

  end

  def authenticate(email)
    user = 
  end

end