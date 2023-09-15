class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items
 has_many :courses, through: :line_items

#    def total_items
#     line_items.sum(:price)
#   end
  
  
#   def add_course(course_id)
#     current_item = line_items.find_by_course_id(course_id)
#     if (current_item)
#       current_item =line_items.build(:course_id => course_id)
#     end
#     current_item #returns the product id, FYI
#   end
  
  
#    def total_price
#    <% byebug %>
#     line_items.to_a.sum {|item| item.price}
#   end
# end

 # def sub_total
 #    sum = 0
 #    self.line_items.each do |line_item|
 #      sum+= line_item.total_price
 #    end
 #    return sum
 #  end




 # def total_items
 #    line_items.sum(:quantity) # Summing the quantity of items, not price
 #  end

 #  def add_course(course_id)
 #    current_item = line_items.find_by(course_id: course_id)

 #    if current_item
 #      current_item = line_items.create(course_id: course_id)
 #    end
 #  end

 #  def total_price
 #    line_items.to_a.sum { |item| items.sum(:price) }
 #  end
end