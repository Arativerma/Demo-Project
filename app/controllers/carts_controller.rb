# class CartsController < ApplicationController
#   before_action :authenticate_user!, only: [:show] 

#   def add
#     @current_cart = @cart
#     @current_cart = @current_cart.courses.new(course_params)
#     @current_cart.save
#     session[:current_cart_id] = @current_cart.id

#     redirect_to :back
#   end

#   def add_to_cart
#     byebug
#     course = Course.find_by(params[:course_id])
#     cart_course=current_user.cart.cart_courses.find_or_intialize_by(course: course)
#     redirect_to @course, notice: 'Course added to cart.'
#   end

#   def add
#     @current_cart = @cart
#     @current_cart = @current_cart.courses.new(course_params)
#     @current_cart.save
#     session[:current_cart_id] = @current_cart.id

#     redirect_to :back
#   end

#   def show
#     @cart = current_user.cart
#     @courses = @cart.courses.includes(:course)
#   end

#   def delete
#     # Implement your delete logic here
#   end

#   private

#   def course_params
#     params.permit(:id)
#   end
# end
class CartsController < ApplicationController
  # def show
  #   @cart = @current_user_cart
  # end
 def show
    @current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  def remove_item
    line_item = LineItem.find(params[:id])
    line_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart.'
  end

  def add_to_cart
    
    @course = Course.find_by(params[:course_id])
   
    @order = current_user.orders.create

    # Check if the course is already in the cart
    if @order.courses.include?(@course)
      @line_item = @order.line_items.find_by(course: @course)
      
    else
      @line_item = @order.line_items.create(course: @course, price: @course.price)
    end
    
    if @line_item.save
     redirect_to courses_path, alert: 'Failed to add course to cart.'
     
    else
       redirect_to cart_path, notice: 'Course added to cart.'

    end
  end

  private

  def cart_params
    params.require(:course).permit(:course_id)
  end
end
