class CoursesController < ApplicationController
    before_action :authenticate_user! # Assuming Devise for authentication
    #load_and_authorize_resource 
    #Load and authorize Course
  
    
     # @courses = Course.where(category: current_user.categories)
      def index
    #@categories = Category.all
      @courses  = Course.all
  end

    

    def associate_videos
    
    @course = Course.find(params[:id])
    videos = [video1, video2, video3] # Replace with your actual video objects or URLs

    @course.course_videos.attach(videos)

    redirect_to @course, notice: 'Videos associated successfully.'
  end
 
  
    def new
      @course = Course.new
      @category =Category.all
    end
  
    def create
  @course = Course.new(course_params)
  @course.category_id = params[:course][:category_id] # Associate with the chosen category

  if @course.save
    redirect_to @course 
  else
    render :new
  end
end
      def show
    @course = Course.find(params[:id])
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
      params.require(:course).permit(:title, :description, :category_id,course_videos:[])
    end
  end
  