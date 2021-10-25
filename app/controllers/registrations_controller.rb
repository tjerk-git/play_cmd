class RegistrationsController < Devise::RegistrationsController
  layout "auth", :only => [ :new, :create ]
  
  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
