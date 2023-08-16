class Admin::UsersController < ApplicationController
  before_action :authenticate_user! # Assuming Devise for authentication
  before_action :authorize_admin # Custom method to check if user is admin

  def manage
    @teacher = User.find(params[:id])
    # You can add more actions and logic here for managing teachers
  end

  private

  def authorize_admin
    unless current_user.admin?
      redirect_to root_path, alert: "You don't have permission to access this page."
    end
  end
end