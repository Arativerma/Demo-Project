class CategoriesController < ApplicationController
    before_action :authenticate_user! # Assuming Devise for authentication
    load_and_authorize_resource # Load and authorize Category
  
    def index
      @categories = Category.where(teacher: current_user)
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = current_user.categories.build(category_params)
      if @category.save
        redirect_to categories_path, notice: 'Category created successfully.'
      else
        render :new
      end
    end
  
    def edit
      # @category is loaded by load_and_authorize_resource
    end
  
    def update
      if @category.update(category_params)
        redirect_to categories_path, notice: 'Category updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @category.destroy
      redirect_to categories_path, notice: 'Category deleted successfully.'
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name)
    end
  end
  