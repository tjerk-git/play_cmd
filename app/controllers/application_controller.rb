class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    add_flash_types :success, :error

    private
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end


    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update) do |user_params|
        user_params.permit(
          { tag_ids: [] },
          :email,
          :password,
          :password_confirmation,
          :name,
          :avatar,
          :about,
          :github_username,
          :twitter_username,
          :dribbble_url,
          :website_url
        )
      end

      devise_parameter_sanitizer.permit(:sign_up,
         keys:
          [:name, :email, :password, :password_confirmation, :invitation_code, { tag_ids: [] }, :avatar]
        )

      # devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      #   user_params.permit(
      #     :invitation_code
      #     :email,
      #     :password,
      #     :password_confirmation,
      #     :name,
      #     )
      # end
    end
end
