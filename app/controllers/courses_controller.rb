# class CoursesController < ApplicationController
#    before_action :authenticate_user!, only: [:show] # Assuming Devise for authentication

#   # ...

#   def associate_videos
#     @course = Course.find(params[:id])
#     videos = [video1, video2, video3] # Replace with your actual video objects or URLs

#     @course.course_videos.attach(videos)

#     redirect_to @course, notice: 'Videos associated successfully.'
#   end

#   def index
#     @courses = Course.all
#   end

#   def new
#     @course = Course.new
#     @categories = Category.all
#   end

#   def create
#     @course = Course.new(course_params)
#     @course.category_id = params[:course][:category_id] # Associate with the chosen category

#     if @course.save
#       redirect_to @course 
#     else
#       render :new
#     end
#   end

#   def show
#     @course = Course.find(params[:id])
#     ##@cart_courses = current_cart.courses.new
#   end


#   def cart
#     @course = Course.find(params[:course_id]) # Retrieve the course
#     @cart = current_user.cart || current_user.create_cart # Get or create the user's cart

#     # Check if the course is already in the cart
#     if @cart.courses.include?(@course)
#       flash[:notice] = "Course is already in your cart."
#     else
#       # Add the course to the cart
#       @cart.cart_courses.create(course: @course, price: @course.price)
#       flash[:notice] = "Course added to your cart."
#     end

#     @cart.save # Save the cart changes
#     redirect_to cart_path # Redirect to the cart page
#   end
#    def search
#     @query = params[:query]
#     @category = params[:category]
#     @max_price = params[:max_price]

#     # Build a query based on the search parameters
#     @courses = Course.all

#     @courses = @courses.where('title LIKE ?', "%#{@query}%") if @query.present?
#     @courses = @courses.where(category: @category) if @category.present?
#     @courses = @courses.where('price <= ?', @max_price) if @max_price.present?
#   end
#   def purchase
#     # Fetch the selected course based on the ID
#     @course = Course.find(params[:id])

   
#     flash[:notice] = 'Purchase process initiated. Payment integration pending.'
#     redirect_to @course
#   end

#   private

#   def course_params
#     params.require(:course).permit(:title, :description, :price, :category_id, course_videos: [])
#   end
# end















class CoursesController < ApplicationController
  before_action :authenticate_user!, only: [:show] # Assuming Devise for authentication

  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
    @categories = Category.all
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

  def cart
    @course = Course.find(params[:id]) # Retrieve the course
    @cart = current_user.cart || current_user.create_cart # Get or create the user's cart

    # Check if the course is already in the cart
    if @cart.courses.include?(@course)
      flash[:notice] = "Course is already in your cart."
    else
      # Add the course to the cart
      @cart.cart_courses.create(course: @course, price: @course.price)
      flash[:notice] = "Course added to your cart."
    end

    @cart.save # Save the cart changes
    redirect_to cart_path # Redirect to the cart page
  end

  def search
    @query = params[:query]
    @category = params[:category]
    @max_price = params[:max_price]

    # Build a query based on the search parameters
    @courses = Course.all

    @courses = @courses.where('title LIKE ?', "%#{@query}%") if @query.present?
    @courses = @courses.where(category: @category) if @category.present?
    @courses = @courses.where('price <= ?', @max_price) if @max_price.present?
  end

  def purchase
    # Fetch the selected course based on the ID
    @course = Course.find(params[:id])

    flash[:notice] = 'Purchase process initiated. Payment integration pending.'
    redirect_to @course
  end

  private

  def course_params
    params.require(:course).permit(:title, :description, :price, :category_id, course_videos: [])
  end
end