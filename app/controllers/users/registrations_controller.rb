class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    if !current_user.provider
    return super if params["password"]&.present?
    end
    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end

end