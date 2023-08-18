class AdminController < ApplicationController
  before_action :authenticate_user! # Assuming Devise for authentication
  before_action :authorize_admin # Custom method to check if user is admin

  def index
    @teachers = User.where(role: 'teacher')
  end

  private

  def authorize_admin
     authorize! :manage, :admin
  end
  end

