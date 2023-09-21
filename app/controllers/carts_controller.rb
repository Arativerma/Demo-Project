
class CartsController < ApplicationController
  before_action :initialize_cart
  def index
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_path
  end

  def show
    @cart = @current_cart
     @line_items = @current_cart.line_items if @current_cart
   # @line_items = @current_cart.line_items
   
  
  end

  def remove_item
    line_item = LineItem.find(params[:id])
    line_item.destroy
    redirect_to cart_path, notice: 'Item removed from cart.'
  end

  def add_to_cart
    @course = Course.find(params[:course_id])
   # @order = current_user.orders.create

    # Check if the course is already in the cart
     if @current_cart.courses.include?(@course)
      @line_item = @current_cart.line_items.find_by(course: @course)
    else
      @line_item = @current_cart.line_items.create(course: @course, price: @course.price)
    end

    if @line_item.save
      redirect_to courses_path, alert: 'Failed to add the course to the cart.'
    else
      redirect_to cart_path, notice: 'Course added to the cart.'
    end
  end

  private


  def set_current_cart
    @current_cart = current_cart
  end

  def initialize_cart
   @current_cart = current_user.cart || current_user.create_cart
    session[:cart_id] = @current_cart.id
  end

  def cart_params
    params.require(:course).permit(:course_id)
  end
end
