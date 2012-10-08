# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_location
  I18n.locale = :ru


  protected

  def get_location


    if session[:geo]
      @geo = session[:geo]
    else
      ip = request.ip

      begin
        geo_response = Net::HTTP.get_response(URI.parse("http://ipgeobase.ru:7020/geo?ip=#{ip}")).body
        geo_data = Nokogiri::XML.parse(geo_response)
        region = geo_data.xpath('//region').children.text
        coder = HTMLEntities.new
        @geo = coder.decode(region)
      rescue
        @geo = '??????'
      end

      if @geo != ''
        session[:geo] = @geo
      end
    end



  end

end


#TODO:  Эхо
