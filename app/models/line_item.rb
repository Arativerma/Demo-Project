class LineItem < ApplicationRecord
	belongs_to :course
	belongs_to :cart
    #belongs_to :order, optional: true
    attr_accessor :price

    delegate :price, to: :course
  #    def total_price
  #   self.quantity * self.product.price
  # end
end
