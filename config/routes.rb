Rails.application.routes.draw do
  # Google Calendar integration
  get 'calendar', to: 'calendar#index', as: :calendar
  post 'calendar/events', to: 'calendar#create_event', as: :create_calendar_event

  # Routes for FunQuotes
  get 'fun_quotes/index'

  # Home page route
  get 'home', to: 'pages#home'
  get 'tasks/next-seven-days', to: 'tasks#next_seven_days', as: :next_seven_days

  # Devise routes for user authentication
  devise_for :users

  # Routes for user profile editing
  resource :user, only: [:edit, :update], controller: 'users'

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

  # Resource routes for grocery lists
  resources :groceries, only: [:index, :new, :create]

  # Resource routes for thoughts
  resources :thoughts, only: [:index, :new, :create]

  # Admin namespace with routes for users and activity logs
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :deactivate
      end
    end
    resources :activity_logs, only: [:index, :show]
  end

  # OAuth callback route
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  # Health check route
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Root path
  root to: 'tasks#index'
end
