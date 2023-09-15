class Order < ApplicationRecord
  belongs_to :user
  # belongs_to :cart
  # belongs_to :course
  has_many :line_items, dependent: :destroy
end
