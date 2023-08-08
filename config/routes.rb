Rails.application.routes.draw do
  devise_for :users
  get 'homes/page'
  root to: 'homes#page' # Use 'homes#page' instead of 'homes/page'
  resources :teachers
  resources :categories
  resources :courses
  resources :students
  resources :purchases

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
