class StudentController < UserController
  def create
    email = params[:email]
    password = params[:password]
    @student = Student.new(params)
    @student.save
    UserMailer.sign_up_confirmation(@student, 'student')
  end
end
