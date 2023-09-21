class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :order
  belongs_to :payment
end
