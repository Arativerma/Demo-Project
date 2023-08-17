class ApplicationController < ActionController::Base
  #...
    before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, alert: exception.message
  end
  def after_sign_up_path_for(resource)
    root_path
  end
  def after_sign_out_path_for(resource_or_scope)
    new_user_registration_path
  end
end
