class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_cart
  before_action :set_current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

 private
  def set_current_cart
    @current_cart = current_user.cart if user_signed_in?
  end

  def initialize_cart
    if user_signed_in?  # Check if a user is logged in
      # If the user is signed in, associate the cart with the current user
      @current_cart = current_user.cart || current_user.create_cart
    else
      # If there is no logged-in user, create a session-based cart
      @current_cart = session[:cart] ||= Cart.new
    end
  end

  def current_cart
    @current_cart ||= current_user.cart
    if @current_cart.nil?
      @current_cart = Cart.create(user_id: current_user.id)
    end
    @current_cart
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
  end

  def after_sign_up_path_for(resource)
    new_user_session_path
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_registration_path
  end
end



























