require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlayCmd
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.exceptions_app = self.routes
    config.action_mailer.default_url_options = { host: ENV['APP_URL'] }

    Bundler.require(*Rails.groups)
    if ['development', 'test'].include? ENV['RAILS_ENV']
      Dotenv::Railtie.load
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    require "view_component/storybook/engine"
    config.view_component.show_previews = true
  end
end
