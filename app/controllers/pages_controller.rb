class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:home]

  def home

    if user_signed_in?
      @recent_tasks = current_user.tasks.order(created_at: :desc).limit(5)
      @recent_categories = current_user.categories.order(created_at: :desc).limit(5)
    else

      @welcome_message = "Welcome to Task Manager. Please sign in or sign up."
    end
  end
end
