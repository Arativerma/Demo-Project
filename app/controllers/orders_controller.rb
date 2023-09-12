 class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.create(order_params)
    @order.total = calculate_order_total(@order)

    if @order.save
      clear_cart
      redirect_to @order, notice: 'Order was successfully placed.'
    else
      render 'carts/show'
    end
  end

  def index
    @orders = current_user.orders
    # Add logic to load all orders for the current user
    # ...

    # Render the order history view
    render 'index'
  end

  def show
    @order = current_user.orders.find(params[:id])
    # Add logic to load order details and associated line items
    # ...

    if @order
      # Render the order details view
      render 'show'
    else
      flash[:error] = "Order not found."
      redirect_to orders_path # Redirect to order history with an error message
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id)
  end

  def calculate_order_total(order)
    # Implement logic to calculate the total price of the order
    # You can calculate the total by summing the prices of the associated line items
    order.line_items.sum(&:price)
  end

  def clear_cart
    # Implement logic to clear the user's cart after placing an order
    current_user.cart.line_items.destroy_all
  end
end
