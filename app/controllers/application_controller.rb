# class ApplicationController < ActionController::Base
#   before_action :authenticate_user!
#   before_action :initialize_cart
#   before_action :configure_permitted_parameters, if: :devise_controller?
#   rescue_from CanCan::AccessDenied do |exception|
#     redirect_to root_path, alert: exception.message
#   end

#   private

#   def initialize_cart
#     if user_signed_in? && current_user.cart.nil?
#       current_user.create_cart
#     end
#   end

#   # Define the current_cart method to retrieve the user's cart.
#   def current_cart
#     @current_cart ||= current_user.cart
#     if @current_cart.nil?
#       @current_cart = Cart.create(user_id: current_user.id)
#     end
#     @current_cart
#   end

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
#   end

#   def after_sign_up_path_for(resource)
#     new_user_session_path
#   end

#   def after_sign_out_path_for(resource_or_scope)
#     new_user_registration_path
#   end
# end





























class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :current_cart  # Added this line
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  private

  def initialize_cart
    if user_signed_in? && current_user.cart.nil?
      current_user.create_cart
    end
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

  private

  # def current_cart
  #   byebug
  #   @current_cart = @cart
  #   if @cart.present?
  #     @cart = Cart.find_by(id: current_user.cart.id)
  #     if @cart.present?
  #       @current_cart = @cart
  #     else
  #       @current_cart = Cart.create(user_id: current_user.id)
  #     end
  #   end
  # end
  
  def current_cart
    @cart = Cart.find_by(id: current_user.cart.id)
    if @cart.present?
      @current_cart = @cart
    else
      @current_cart = Cart.create(user_id: current_user.id)
    end
  end
end
