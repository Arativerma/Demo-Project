class Category < ApplicationRecord
  #belongs_to :teacher, class_name: 'User'
  validates :name, presence: true, uniqueness: true
  has_many :courses

  
end
