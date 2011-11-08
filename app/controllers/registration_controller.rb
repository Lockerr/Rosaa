class RegistrationsController < Devise::RegistrationsController

  def create
    super
  end


  def edit
    super
  end

  protected

    def after_update_path_for(resource)
      root_path(resource)
    end

    def after_sign_up_path_for(resource)
      edit_user_registration_url(resource)
    end

end