class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { student: 0, teacher: 1, admin: 2 }
  
  # Associations
  has_many :courses, foreign_key: 'teacher_id'
  has_many :categories, foreign_key: 'teacher_id'
  has_many :purchases, foreign_key: 'student_id'

  after_create :welcome_email

    def teacher?
    role == 'teacher'
  end

  def student?
    role == 'student'
  end

  private

  def welcome_email
    if student?
      UserMailer.welcome_email(self).deliver_now
    end
  end
end
