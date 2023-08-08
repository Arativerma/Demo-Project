class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  enum role: [:student, :teacher, :admin]
  has_many :courses, foreign_key: :teacher_id # For teachers
  has_and_belongs_to_many :enrolled_courses, class_name: 'Course'

  after_create :send_welcome_email

  private

  def send_welcome_email
    if student?
      StudentMailer.welcome_email(self).deliver_now
      # Additional student-specific logic
    elsif teacher?
      # Additional teacher-specific logic
    elsif admin?
      # Additional admin-specific logic
    end
  end
end
