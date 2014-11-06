class SessionsController < Devise::SessionsController
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render status: 201, json: {
      user_token: self.resource.authentication_token,
      user_email: self.resource.email
    }
  end
end
