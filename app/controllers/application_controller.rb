class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # Permit the `name` parameter for sign-up
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # Permit the `name` parameter for account update
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
  end
