class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { student: 0, teacher: 1, admin: 2 }
  
  # Associations
  has_one :cart
  has_many :courses, foreign_key: 'teacher_id'
  has_many :categories, foreign_key: 'teacher_id'
  has_many :purchases, foreign_key: 'student_id'

  after_create :welcome_email
 before_create :set_default_role

 scope :teachers, -> { where(role: 'teacher') }

  private
 
  def set_default_role
    self.role ||= 'student' # Set the default role to 'student' if no role is specified
  end

  

  def welcome_email
    if student?
      UserMailer.welcome_email(self).deliver_now
    end
  end
end
