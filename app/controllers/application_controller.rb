class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_location
  I18n.locale = :ru


  protected

  def get_location
    # текущий айпишник
    #ip = request.env["HTTP_X_FORWARDED_FOR"]
    #ip = request.ip
    # ответ геосервера
    #ip = 12
    #geo_response = Net::HTTP.get_response(URI.parse("http://ipgeobase.ru:7020/geo?ip=#{ip}")).body

    # распарсить xml
    #geo_data = Nokogiri::XML.parse(geo_response)

    # текущий регион
    #region = geo_data.xpath('//city').children.text

    #logger.info region
    # html конвертер
    #coder = HTMLEntities.new

    # перекодировать
    @geo = "" #coder.decode(region)


  end

end


#TODO:   Валидация
#TODO:   Кнопки регистрации
#TODO:  Эхо
