class Course < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  belongs_to :category
  has_many :purchases
  has_many :students, through: :purchases, source: :student
end
