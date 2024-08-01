Rails.application.routes.draw do
  # Routes for FunQuotes
  get 'fun_quotes/index'
  get 'home', to: 'pages#home'

  # Devise routes for user authentication
  devise_for :users

  # Resource routes for tasks, including nested resources for subtasks
  resources :tasks do
    resources :subtasks, only: [:create, :update, :destroy]

    member do
      patch :mark_as_completed
      patch :set_priority
      post :set_reminder
    end
  end

  # Resource routes for categories
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # Admin namespace with routes for users and activity logs
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :deactivate
      end
    end
    resources :activity_logs, only: [:index, :show]
  end

  # Health check route
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Root path
  root to: 'tasks#index'
end
