class CoursesController < ApplicationController
    before_action :authenticate_user! # Assuming Devise for authentication
    load_and_authorize_resource 
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
     def add_to_cart
    @course = Course.find(params[:id]) # Retrieve the course
    @cart = current_user.cart || current_user.build_cart # Get or create the user's cart

    # Check if the course is already in the cart
    if @cart.courses.include?(@course)
      flash[:notice] = "Course is already in your cart."
    else
      # Add the course to the cart
      @cart.cart_items.create(course: @course, price: @course.price)
      flash[:notice] = "Course added to your cart."
    end

    @cart.save # Save the cart changes
    redirect_to cart_path # Redirect to the cart page
  end

     def start_purchase
    @course = Course.find(params[:id])
  end

  def complete_purchase
    @course = Course.find(params[:id])
    # Implement purchase logic here
    # Update user's access to the course, handle payment, etc.
    if purchase_successful?
      redirect_to @course, notice: 'Course purchased successfully!'
    else
      redirect_to @course, alert: 'Purchase failed. Please try again.'
    end
  end
  
    def destroy
      @course.destroy
      redirect_to courses_path, notice: 'Course deleted successfully.'
    end
  
    private
  
    def course_params
      params.require(:course).permit(:title, :description, :price, :category_id,course_videos:[])
    end
  end
  