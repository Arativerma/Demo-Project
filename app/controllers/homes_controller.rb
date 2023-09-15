class HomesController < ApplicationController
  def index
    if user_signed_in?
      if current_user.admin?
        # Content for admin users
        @teachers = Teacher.all
        @students = Student.all
        # You can display a list of teachers and students, or any admin-specific information.
      elsif current_user.teacher?
        # Content for teacher users
        @categories = current_user.categories
        # You can display the categories created by the teacher, along with relevant information.
      elsif current_user.student?
        # Content for student users
        @courses = Course.all
        # You can display a list of available courses, allow searching, etc.
      end
    else
      # Content for guests or unauthenticated users
      # You can display a welcome message or information about your application.
    end
    def about
       #@company_info = CompanyInfo.first
        render 'home/about'
    end
    def contact
      # @contact_info = ContactInfo.first
        render 'home/contact'
    end
  end
end

