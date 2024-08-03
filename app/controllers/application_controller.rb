class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  def set_sidebar_events
    if user_signed_in?
      @events = current_user.events
    else
      @events = []
    end
  end
end
