class Student < ApplicationRecord
    has_and_belongs_to_many :enrolled_courses, class_name: 'Course'
  belongs_to :user
end
