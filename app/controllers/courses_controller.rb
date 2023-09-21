class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :initialize_cart
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @courses = Course.all
  end

  def show
    # Add any specific logic for displaying a course here
  end

  def new
    @course = Course.new
    @categories = Category.all
  end

  def create

    @course = Course.new(course_params)

    if @course.save
      redirect_to @course, notice: 'Course was successfully created.'
    else
      render :new
    end
  end

  def edit
    @course = Course.find(params[:id])
  authorize! :edit, @course
    # Add any specific logic for editing a course here
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Course was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    
    @course = Course.find(params[:id])
    authorize! :destroy, @course
    @course.destroy
    redirect_to courses_url, notice: 'Course was successfully destroyed.'
  end

  def cart
    # Add cart-related actions here (e.g., adding/removing courses from the cart)
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :description, :price, :category_id, course_videos: [])
  end

  # def initialize_cart
  #   if session[:cart].nil?
  #     session[:cart] = []
  #   end
  # end
end
