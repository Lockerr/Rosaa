class SessionsController < Devise::SessionsController
  def new

  end

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#failure")
    sign_in(resource_name, resource)
    c = User.count
    return render :json => { :success => true, :signed_up => true, :count => c, :content => render_to_string(:layout => false, :partial => 'layouts/user_nav') }
  end

  def failure
    c = User.count
    build_resource
    partial = ''

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_in(resource_name, resource)
        c = User.count
        return render :json => { :success => true, :count => c, :content => render_to_string(:layout => false, :partial => 'layouts/user_nav') }
      else
        set_flash_message :notice, :inactive_signed_up, :reason => inactive_reason(resource) if is_navigational_format?
        expire_session_data_after_sign_in!
        return render :json => { :success => false, :count => c, :content => render_to_string(:layout => false, :partial => 'devise/confirmations/sent') }

      end
    else
      u = User.find_by_email(resource.email)
      errors = resource.errors
      if errors.messages.keys.include?(:email) and !u
        partial = 'wrong_email'
      elsif !u.confirmed? and u
        partial = 'not_confirmed'
      elsif u and !u.valid_password?(params[:user] ? params[:user][:password] : '')
        resource.errors.messages.delete(:email)
        partial = 'wrong_password'
      elsif errors.messages.keys.include?(:email) and u
        resource.errors.messages.delete(:email)
        partial = 'wrong_password'
      elsif errors.messages.keys.include? :password
        partial = 'wrong_password'
      elsif !(params[:user][:email] =~ (/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i))
        partial = 'wrong_email'
      else
        partial = 'relogin'
      end
      logger
      return render :json => { :success => false, :count => c, :content => render_to_string(:layout => false, :resource => resource, :partial => "devise/errors/#{partial}") } if partial


    end
  end
end