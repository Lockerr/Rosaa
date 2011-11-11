class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in(resource_name, resource)
    return render :json => {:success => true, :content => render_to_string(:layout => false, :partial => 'layouts/user_nav')}
  end

  def failure
    build_resource

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        return render :json => {:success => true, :content => render_to_string(:layout => false, :partial => 'layouts/user_nav')}
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        return render :json => {:success => true, :errors => t('err_confirm')}

      end
    else
      action = ''
      errors = resource.errors
      #rise (errors.messages.flatten.join(" ").scan(/email/) == true).inspect
      if errors.messages.flatten.join.scan(/email/)
        if User.find_by_email(resource.email)
          errors = t('wrong_password')
          action = 'Resend'
        end
      end
      clean_up_passwords(resource)
      if action == 'Resend'
        return render :json => {:success => false, :content => render_to_string(:layout => false, :partial => 'devise/reset_password')}
      else
        return render :json => {:success => false, :content => render_to_string(:layout => false, :partial => 'devise/confirmations/new')}
      end

    end
  end

end