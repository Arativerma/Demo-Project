Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Active Admin routes
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # Define root path (homepage)
  root 'homes#index'
   get "homes", to: "homes#index"
#   root 'homes#index'
  get 'about', to: 'homes#about'
  get 'contact', to: 'homes#contact'

  # Categories routes
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # Courses routes
  resources :courses, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    # Add a custom route for adding a course to the cart
    post 'add_to_cart', on: :member
  end

  # Cart routes
  resource :cart, only: [:show, :destroy] do
    # Custom route for removing an item from the cart
    delete 'remove_item/:id', action: 'remove_item', as: 'remove_item'
  end

  # Line Items routes (used for adding and removing items from the cart)
  resources :line_items, only: [:create, :destroy]
 # delete 'remove_item/:id', to: 'line_items#remove_item', as: 'remove_item_cart'


  # Payments routes
  resources :payments, only: [:new, :create]

  # Orders routes (for order history)
  resources :orders, only: [:index, :show]

  # Add any other routes specific to your application here
end
