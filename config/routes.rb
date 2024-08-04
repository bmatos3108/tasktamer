Rails.application.routes.draw do
  # Google Calendar integration
  get 'calendar', to: 'calendar#index', as: :calendar
  post 'calendar/events', to: 'calendar#create_event', as: :create_calendar_event

  # FunQuotes
  get 'fun_quotes/index'

  # Home page
  get 'home', to: 'pages#home'

  # Tasks
  resources :tasks do
    resources :subtasks, only: [:create, :update, :destroy]
    member do
      patch :mark_as_completed
      patch :set_priority
      post :set_reminder
    end
  end

  get 'tasks/next-seven-days', to: 'tasks#next_seven_days', as: :next_seven_days

  # User authentication
  devise_for :users

  # User profile
  resource :user, only: [:edit, :update], controller: 'users'

  # Categories
  resources :categories, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  # Grocery lists
  resources :groceries, only: [:index, :new, :create]

  # Thoughts
  resources :thoughts, only: [:index, :new, :create]

  # Admin namespace
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update] do
      member do
        patch :deactivate
      end
    end
    resources :activity_logs, only: [:index, :show]
  end

  # OAuth callback
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  # Health check
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Root path
  root to: 'tasks#index'
end
