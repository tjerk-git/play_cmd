require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlayCMD
  class Application < Rails::Application
    config.load_defaults 7.0

    config.to_prepare do
      Devise::SessionsController.layout       = "auth"
      Devise::RegistrationController.layout   = "auth"
      Devise::ConfirmationsController.layout  = "auth"
      Devise::UnlocksController.layout        = "auth"
    end
  end
end
