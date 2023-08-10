class Category < ApplicationRecord
   # belongs_to :teacher
  has_many :courses
end
