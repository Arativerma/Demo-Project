ActiveAdmin.register Course do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :title, :description, :price, :category_id, course_videos: [] 

  form do |f|
    f.inputs "Course Details" do
      f.input :title
      f.input :description
      f.input :price
      f.input :category_id, as: :select, collection: Category.all.map { |cat| [cat.name, cat.id] }
     f.input :course_videos, as: :file, input_html: { multiple: true }
    end
    f.actions
  end
   controller do
    authorize_resource
  end
   index do
    
    actions do |course|
      item "Edit", edit_admin_course_path(course) if can? :edit, course
      item "Delete", admin_course_path(course), method: :delete, data: { confirm: "Are you sure?" } if can? :destroy, course
    end
end 
controller do
    # ...

    def create
      # Create the new course
      @course = Course.new(permitted_params[:course])

      if @course.save
        redirect_to courses_path, notice: 'Course was successfully created.'
      else
        render :new
      end
    end
  end
end 
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
