# Rails.application.routes.draw do
#   get 'users/index'
#   # get 'carts/add_to_cart'
#   # Devise for Admin Users (ActiveAdmin)
#   devise_for :admin_users, ActiveAdmin::Devise.config

#   # Home Page
#   root 'homes#index'

#   # Custom route for homes
#   get "/homes", to: "homes#index"

#   # Devise for Users
#   devise_for :users

#   # Categories and Courses
#   resources :categories, only: [:index, :show]
#   resources :courses do
#   member do
#     post 'purchase'
#   end
#   get '/courses/search', to: 'courses#search', as: 'courses_search'
# end 

#   # resources :courses do
#   #   member do
#   #     get 'start_purchase'
#   #     post 'add_to_cart'
#   #     post 'complete_purchase'
#   #   end
#   # end
# #  resources :carts do
# #   post :add_to_cart, on: :collection
# # end

# # resources :orders, only: [:new, :create]

# #   # Purchases
# #   resources :purchases do
# #     collection do
# #       get 'start_purchase'
# #     end
# #     post 'create', on: :collection # Create purchase
# #   end

# # get 'carts/:id' => "carts#show", as: "cart"

# # delete 'carts/:id' => "carts#destroy"

#  resources :carts, only: [:show] do
#     get :add_to_cart, on: :member
#     get 'remove_item', on: :member
#   end

# post 'line_items' => "line_items#create"
# get 'line_items/:id' => "line_items#show", as: "line_item"
# delete 'line_items/:id' => "line_items#destroy"
# get 'line_items' => "line_items#index"


# resources :orders


# resources :courses
#   # Search
#   get 'search', to: 'search#index'
#   resources :payments, only: [:new, :create] do
#   collection do
#     get 'success'
#     get 'failure'
#   end

#   # ActiveAdmin routes
#   ActiveAdmin.routes(self)
# end














Rails.application.routes.draw do
  # Users
  get 'users/index'

  # Devise for Admin Users (ActiveAdmin)
  devise_for :admin_users, ActiveAdmin::Devise.config

  # Home Page
  root 'homes#index'

  # Custom route for homes
  get "/homes", to: "homes#index"

  # Devise for Users
  devise_for :users

  # Categories and Courses
  resources :categories, only: [:index, :show]
  
  resources :courses do
    member do
      post 'purchase'
    end
    get 'search', on: :collection # Add this for course search
  end

  # Carts
  resources :carts, only: [:show] do
    get :add_to_cart, on: :member
    get 'remove_item', on: :member
  end

  # Line Items
  resources :line_items, only: [:create, :show, :index, :destroy]

  # Orders
  resources :orders

  # Search
  get 'search', to: 'search#index'

  # Payments
  resources :payments, only: [:new, :create] do
    collection do
      get 'success'
      get 'failure'
    end
  end

  # ActiveAdmin routes
  ActiveAdmin.routes(self)
end
