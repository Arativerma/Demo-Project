class Payment < ApplicationRecord

    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :currency, presence: true
    validates :payment_method_types, presence: true
    validates :card_number, presence: true, length: { is: 16 }
    validates :expiration_month, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
    validates :expiration_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: Time.current.year }
    validates :cardholder_name, presence: true
    validates :billing_address, presence: true
    belongs_to :user
end

