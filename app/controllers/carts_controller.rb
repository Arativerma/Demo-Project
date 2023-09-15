
class CartsController < ApplicationController
  # def show
  #   @cart = @current_user_cart
  # end
 def show
    @cart = Cart.find_by(user_id: params[:id])
   @cart = @current_cart
  # @line_items = @cart.line_items
   # @current_cart ||= Cart.find_or_create_by(user_id: current_user.id)
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
     #@line_item = @cart.line_items.build(course: @course, price: @course.price)
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
