class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items  # Assuming you have a LineItem model for order items

  # Validations
  validates :status, presence: true
  validates :total_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :shipping_address, presence: true
  validates :billing_address, presence: true
  validates :payment_method, presence: true

  enum status: { pending: 'pending', processing: 'processing', shipped: 'shipped', delivered: 'delivered', canceled: 'canceled' }

end
