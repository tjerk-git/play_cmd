class SessionsController < Devise::SessionsController
  layout 'auth'

  def create
    super
  end

end
