PlayCmd::Application.configure do
  config.to_prepare do
    Devise::SessionsController.layout       "auth"
    Devise::RegistrationsController.layout  "auth"
    Devise::ConfirmationsController.layout  "auth"
    Devise::UnlocksController.layout        "auth"
    Devise::PasswordsController.layout      "auth"
  end
end