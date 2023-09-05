class PurchasesController < ApplicationController
    #before_action :authenticate_user! # Assuming Devise for authentication
  
     def start_purchase
    @courses = Course.all # Replace Item with your actual model name
     end
     def create
      course = Course.find(params[:course_id])
      purchase = current_user.purchases.build(course: course)
      
      if purchase.save
        redirect_to courses_path, notice: 'Course purchased successfully.'
      else
        redirect_to courses_path, alert: 'Course purchase failed.'
      end
    end
  end
  *