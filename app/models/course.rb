class Course < ApplicationRecord
  belongs_to :category
  belongs_to :teacher
  has_and_belongs_to_many :students, class_name: 'User' # For students
 
end
