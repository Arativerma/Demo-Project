class LineItemsController < ApplicationController
  before_action :set_current_cart, only: [:create]

  def create
   chosen_course = Course.find_by(id: params[:course_id])
     line_item = LineItem.new(course: chosen_course, cart: @current_cart)
    # Check if the course is already in the cart
    if @current_cart.courses.include?(chosen_course)
      @line_item = @current_cart.line_items.find_by(course_id: chosen_course.id)
    else
      @line_item = LineItem.new(course: chosen_course, cart: @current_cart)
    end

    if @line_item.save

      redirect_to cart_path(chosen_course)
    # else
      # Handle any errors that may occur during line item creation
      # You can add your error handling logic here
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end

  private

  def set_current_cart
  @current_cart = Cart.find_by(id: session[:cart_id])

  if @current_cart.nil?
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
  end
rescue ActiveRecord::RecordNotFound
  @current_cart = Cart.create
  session[:cart_id] = @current_cart.id
end

  def line_item_params
    params.require(:line_item).permit(:course_id, :price, :cart_id, :order_id)
  end
end







# class LineItemsController < ApplicationController
#   before_action :set_current_cart, only: [:create]

#   def create
#     chosen_course = Course.find_by(id: params[:course_id])
#    current_cart = @current_cart
#    byebug
#    if @cart.courses.include?(@course)
#     # Find the line_item with the chosen_product
#     @line_item = current_cart.line_items.find_by(:course_id => chosen_course)
#     # Iterate the line_item's quantity by one
    
#   else
#     @line_item = LineItem.new
#     @line_item.cart = current_cart
#     @line_item.course = chosen_course
#   end
#   @line_item.save
#   redirect_to cart_path(current_cart)
# end

# private
#  def set_current_cart
#      @current_cart = current_cart
#  end


#   def line_item_params
#     params.require(:line_item).permit(:course_id, :cart_id)
#   end 
# end 
#   end
#     #@line_item = LineItem.new(line_item_params)
#     #xbyebug
#     @line_item = current_cart.line_items.find_or_initialize_by(course_id: params[:course_id])
#      @line_item = LineItem.create!(params[:line_item].merge(:cart => current_cart))
#     @order = Order.find_by(params[:order_id])

#     @line_item = @order.line_items.find_by(course_id: chosen_course.id)
#     chosen_course = Course.find(params[:course_id])

#     # Find the order associated with the current user (if it exists)
#     @order = current_user.orders.find_by(id: params[:order_id])

#     # if @order.nil?
#     #   # If the order doesn't exist, create a new one for the user
#     #   @order = current_user.orders.create
#     # end

#     # Check if the chosen course is already in the cart
    
    
#     if @line_item.present?
#       # If the line item doesn't exist, create a new one
#       @line_item = @order.line_items.build(course: chosen_course)
#     end
  
#     if @line_item.save
#       puts @order.inspect
#       redirect_to add_to_cart_cart_path(@order.cart), notice: 'Course added to cart.'
#     else
#       redirect_to courses_path, alert: 'Failed to add course to cart.'
#     end
#   end

#   private

#   def set_current_cart
#     @current_cart = current_cart
#   end

#   def line_item_params
#     params.require(:line_item).permit(:course_id, :price, :cart_id, :order_id)
#   end
# end



































# class LineItemsController < ApplicationController
#   before_action :set_current_cart, only: [:create]

#   def create
#     chosen_course = Course.find(params[:course_id])
#     @order = current_user.orders.find_by(params[:order_id])
#      if @order
#     @line_item = @order.line_items.build(line_item_params)
#  # Assuming you have an association between User and Order
#     #@line_item = @order.line_items.create(params:[id])
#   end 
#   end

#     if @current_cart&.courses&.include?(chosen_course)
#       @line_item = @current_cart.line_items.find_by(course_id: chosen_course.id)
#     # else
#     #   @line_item = LineItem.new(course: chosen_course, cart: current_cart, order: @order)
#      end

#     if @line_item.save
#       redirect_to cart_path(@order.cart), notice: 'Course added to cart.'
#     else
#       redirect_to courses_path, alert: 'Failed to add course to cart.'
#     end
#   end

#   private

#   def set_current_cart
#     @current_cart = current_cart
#   end

#   def line_item_params
#     params.require(:line_item).permit(:course_id, :price, :cart_id, :order_id)
#   end
# end













# class LineItemsController < ApplicationController
#   before_action :set_current_cart, only: [:create]

#   def create
#     chosen_course = Course.find(params[:course_id])

#     # Find the order associated with the current user (if it exists)
#     @order = current_user.orders.find_by(id: params[:order_id])

#     if chosen_course && @order
#       @line_item = LineItem.new(course: chosen_course, order: @order)

#       if @order.nil?
#         # If the order doesn't exist, create a new one for the user
#         @order = current_user.orders.create
#       end

#       # Check if the chosen course is already in the cart
#       @line_item = @order.line_items.find_by(course_id: chosen_course.id)

#       if @line_item.nil?
#         # If the line item doesn't exist, create a new one
#         @line_item = @order.line_items.build(course: chosen_course)
#       end

#       if @line_item.save
#         puts @order.inspect
#         redirect_to cart_path(@order.cart), notice: 'Course added to cart.'
#       else
#         redirect_to courses_path, alert: 'Failed to add course to cart.'
#       end
#     else
#       redirect_to courses_path, alert: 'Invalid course or order.'
#     end
#   end

#   private

#   def set_current_cart
#     @current_cart = current_cart
#   end

#   def line_item_params
#     params.require(:line_item).permit(:course_id, :price, :cart_id, :order_id)
#   end
# end
