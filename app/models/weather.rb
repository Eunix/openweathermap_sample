class Weather
  require 'open-uri'

  include ActiveModel::Model

  attr_accessor :country, :city

  def info
    JSON.load(
      open(
        "#{Settings.openweathermap.uri}?APPID=#{Settings.openweathermap.api_token}&q=#{city},#{country}&units=metric"
      )
    )
  end
end
