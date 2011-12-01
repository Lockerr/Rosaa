class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_location
  I18n.locale = :ru


  protected

  def get_location
    if session[:geo]
      @geo = session[:geo]
    else
      # текущий айпишник
      ip = request.env["HTTP_X_FORWARDED_FOR"]
      ip = request.ip

      geo_response = Net::HTTP.get_response(URI.parse("http://ipgeobase.ru:7020/geo?ip=#{ip}")).body

      # распарсить xml
      geo_data = Nokogiri::XML.parse(geo_response)

      # текущий регион
      region = geo_data.xpath('//city').children.text

      # html конвертер
      coder = HTMLEntities.new

      # перекодировать
      @geo = coder.decode(region)
      if @geo != ''
        session[:geo] = @geo
      end
    end



  end

end


#TODO:   Валидация
#TODO:   Кнопки регистрации
#TODO:  Эхо
#TODO: КНопка home
