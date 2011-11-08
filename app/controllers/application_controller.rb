class ApplicationController < ActionController::Base
  protect_from_forgery
  I18n.locale = :ru

  layout :layout_by_resource

  protected

  def layout_by_resource
      if devise_controller?
        "sessions"
      elsif
        "application"
      end
    end

end


#TODO: