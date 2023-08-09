Rails.application.routes.draw do
  #devise_for :users
  devise_for :students, path: 'students', path_names: { sign_up: 'signup', sign_in: 'login' }
  devise_for :teachers, path: 'teachers', path_names: { sign_up: 'signup', sign_in: 'login' }
  devise_for :admins, path: 'admins', path_names: { sign_up: 'signup', sign_in: 'login' }

  get 'homes/page'
  root to: 'homes#page' # Use 'homes#page' instead of 'homes/page'
  #resources :teachers
  resources :categories do
    resources :courses, only: [:new, :create]
  end
  resources :courses, except: [:new, :create]
  #resources :students
  #resources :purchases

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
