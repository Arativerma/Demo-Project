class CoursesController < ApplicationController
    #before_action :authenticate_user! # Assuming Devise for authentication
    #load_and_authorize_resource # Load and authorize Course
  
    def index
      @courses = Course.where(category: current_user.categories)
    end
  
    def new
      @course = Course.new
    end
  
    def create
        @category = Category.find(params[:category_id])
        @course = @category.courses.build(course_params)    
      if @course.save
        redirect_to courses_path, notice: 'Course created successfully.'
      else
        render :new
      end
    end
  
    def edit
      # @course is loaded by load_and_authorize_resource
    end
  
    def purchase
       @course = Course.find(course_params)
        current_user.purchases.create(course: @course)
        redirect_to courses_path, notice: 'Course updated successfully.'
      
    end
  
    def destroy
      @course.destroy
      redirect_to courses_path, notice: 'Course deleted successfully.'
    end
  
    private
  
    def course_params
      params.require(:course).permit(:title, :description, :category_id)
    end
  end
  