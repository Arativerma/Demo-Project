class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:student, :teacher]
  has_many :courses, foreign_key: :teacher_id # For teachers
  has_and_belongs_to_many :enrolled_courses, class_name: 'Course'

  #after_create :send_welcome_email

  #private

#def send_welcome_email
 #   if student?
  #####end
end
