class Course < ApplicationRecord
  belongs_to :category
  belongs_to :teacher
end
