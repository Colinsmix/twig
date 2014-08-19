class Users::RegistrationsController < Devise::RegistrationsController

  attr_accessible :first_name, :last_name

  protected

  def after_update_path_for(resource)
    user_profile_path(current_user)
  end
end
