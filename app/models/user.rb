class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         enum role: { student: 0, teacher: 1, admin: 2 }
    # Role enum
    # Associations
    has_many :courses, foreign_key: 'teacher_id'
    has_many :categories, foreign_key: 'teacher_id'
    has_many :purchases, foreign_key: 'student_id'
  end
  

  #after_create :send_welcome_email

  #private

#def send_welcome_email
 #   if student?
  #####end
