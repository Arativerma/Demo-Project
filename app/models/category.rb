class Category < ApplicationRecord
  belongs_to :teacher, class_name: 'User'
  has_many :courses
end
