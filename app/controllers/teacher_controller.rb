class TeacherController < UserController
  def create
    email = params[:email]
    password = params[:password]
    @teacher = Teacher.new(params)
    @teacher.save
    UserMailer.sign_up_confirmation(@teacher, 'teacher')
  end

end
