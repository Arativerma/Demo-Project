class LineItemsController < ApplicationController
  before_action :set_current_cart, only: [:create]

  def create
    @course = Course.find(params[:course_id])
    current_cart = @current_cart

    # Check if the course is already in the cart
    if current_cart.courses.include?(@course)
      @line_item = current_cart.line_items.find_by(course: @course)
    else
      @line_item = LineItem.new(cart: current_cart, course: @course)
    end

    if @line_item.save
      redirect_to cart_path(@course), notice: 'Course added to cart.'
    else
      redirect_to courses_path, alert: 'Failed to add course to cart.'
    end
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

end



