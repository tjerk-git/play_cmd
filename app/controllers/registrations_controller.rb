class RegistrationsController < Devise::RegistrationsController
  def new
    self.resource = build_resource
    render layout: "auth"
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end
end
