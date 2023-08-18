Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
 
  get "/homes", to: "homes#index"
  devise_for :users#, controllers: {
   # registrations: 'users/registrations', # Customize Devise registrations controller if needed
    #confirmations: 'users/confirmations' # Customize Devise confirmations controller if needed
  #}
  
  
#get "/homes", to: "homes#index"
  root 'homes#index' # Landing page

  resources :categories
  resources :courses

  resources :purchases, only: [:create] # PurchasesController (for student purchases)

 # resources :teachers, only: [:index, :new, :create, :edit, :update] # TeachersController

  get 'search', to: 'search#index'
   ActiveAdmin.routes(self) # SearchController

  # Other routes

  # Custom routes for handling sign-out and teacher sign-up
  # devise_scope :user do
  #   get 'teachers/sign_up', to: 'teachers#new' # Customize if needed
  #   delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  # end
end
=begin
  
rescue StandardError => e
  
end
Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
 
  devise_for :users
  resources :categories do
    resources :courses
  end
  root 'homes#index'
  resources :admin, only: [:index, :create]
   ActiveAdmin.routes(self)
  # ...
=end
