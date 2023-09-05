class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :initialize_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  # protect_from_forgery with: :exception

  before_action :current_cart
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

  def current_cart
      @current_cart = current_user.cart
      if current_user.cart.present?
        cart = Cart.find_by(id: current_user.cart.id)
        if cart.present?
          @current_cart = cart
        else
          @current_cart = Cart.create(user_id: current_user.id)
        end
  end
end 
end
