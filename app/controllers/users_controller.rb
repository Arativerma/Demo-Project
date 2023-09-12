class UsersController < ApplicationController
  before_action :authenticate_user!  # Assuming you're using Devise for authentication

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      # Handle successful update
    else
      render :edit
    end
  end
  def create
  @user = User.new(user_params)
  if @user.save
    # Create a cart for the user
    @user.create_cart
    # Rest of your code
  else
    # Handle errors
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
