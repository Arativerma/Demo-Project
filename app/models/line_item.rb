class LineItem < ApplicationRecord
	belongs_to :course
	belongs_to :cart
    belongs_to :order, optional: true
    attr_accessor :price

    delegate :price, to: :course
end
