class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def not_found
      raise ActionController::RoutingError.new('Not Found')
    end

    private
    def after_sign_out_path_for(resource_or_scope)
      root_path
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
          :avatar
          )
      end

      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :invitation_code])

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
