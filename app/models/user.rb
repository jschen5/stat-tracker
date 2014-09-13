class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :trackable, :validatable, :rememberable

  attr_accessible :email, :registration_complete, :username, :password, :password_confirmation

end
