require_relative "boot"

require "rails/all"
require "devise"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Tasktamer
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Ensure Sprockets configurations are removed or not present
    # Comment out or remove Sprockets related configurations if any

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Ensure application configuration is clean
    config.action_controller.raise_on_missing_callback_actions = false if Rails.version >= "7.1.0"

    config.generators do |generate|
      generate.assets false
      generate.helper false
      generate.test_framework :test_unit, fixture: false
    end

    # Optional: Additional settings if necessary
  end
end
