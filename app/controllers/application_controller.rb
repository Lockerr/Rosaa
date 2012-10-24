# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_location
  I18n.locale = :ru


  protected

  def get_location


    if session[:geo]
      if session[:geo] == '??????'
        @geo = ''
        session.delete :geo
      else
        @geo = session[:geo]
      end
    else
      ip = request.ip

      begin
        geo_response = Net::HTTP.get_response(URI.parse("http://ipgeobase.ru:7020/geo?ip=#{ip}")).body
        geo_data = Nokogiri::XML.parse(geo_response)
        region = geo_data.xpath('//region').children.text
        coder = HTMLEntities.new
        @geo = coder.decode(region)
      rescue
        @geo = ''
      end

      unless @geo == ''
        session[:geo] = @geo
      end
    end



  end

  def after_update_path_for(resource)
    root_path
  end

  def after_sign_up_path_for(resource)
    edit_user_registration_url(resource)
  end

end


#TODO:  Эхо
