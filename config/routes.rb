Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations', # Customize Devise registrations controller if needed
    confirmations: 'users/confirmations' # Customize Devise confirmations controller if needed
  }

  root 'home#index' # Landing page

  resources :categories do # CategoriesController
  resources :courses 
  end # CoursesController
  resources :purchases, only: [:create] # PurchasesController (for student purchases)

  resources :teachers, only: [:index, :new, :create, :edit, :update] # TeachersController

  get 'search', to: 'search#index' # SearchController

  # Other routes

  # Custom routes for handling sign-out and teacher sign-up
  #devise_scope :user do
   # get 'teachers/sign_up', to: 'teachers#new' # Customize if needed
    #delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  #end
end
