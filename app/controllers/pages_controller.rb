class PagesController < ApplicationController
  # Ensure the home action is only accessible to authenticated users
  before_action :authenticate_user!, only: [:home]

  def home
    # Example of fetching recent tasks if the user is signed in
    if user_signed_in?
      @recent_tasks = current_user.tasks.order(created_at: :desc).limit(5)
      @recent_categories = current_user.categories.order(created_at: :desc).limit(5)
    else
      # Logic for non-authenticated users can be added here
      # Example: set a welcome message or featured content
      @welcome_message = "Welcome to Task Manager. Please sign in or sign up."
    end
  end

  # Other actions (if needed) can be added here
  # For example, if you had a contact page or about page:
  #
  # def contact
  #   # Logic for contact page
  # end
  #
  # def about
  #   # Logic for about page
  # end
end
