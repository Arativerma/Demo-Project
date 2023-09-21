class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end
  
  def create
  @order = Order.new(order_params)
  @current_cart.line_items.each do |item|
    @order.line_items << item
    item.cart_id = nil
  end
  @order.save
  Cart.destroy(session[:cart_id])
  session[:cart_id] = nil
  redirect_to root_path
end

private

  def set_order
    @order = Order.find(params[:id])
  end

def order_params
    params.require(:order).permit(:status, :total_amount, :shipping_address, :billing_address, :payment_method)
  end
end

