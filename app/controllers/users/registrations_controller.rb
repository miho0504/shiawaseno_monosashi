class Users::RegistrationsController < Devise::RegistrationsController
  protected

  def after_update_path_for(resource)
    users_show_path(current_user)
  end
end