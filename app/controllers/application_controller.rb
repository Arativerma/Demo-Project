class ApplicationController < ActionController::Base
  # ...
  before_action :authenticate_user!
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
  end
  
  
  def after_sign_up_path_for(resource)
    new_user_session_path
  end
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_registration_path
  end
end
