class Weather
  require 'open-uri'

  include ActiveModel::Model

  attr_accessor :country, :city

  def temperature
    openweathermap['main']['temp']
  end

  private

  def openweathermap
    JSON.load(open("#{openweathermap_url}&q=#{city},#{country}&units=metric"))
  end

  def openweathermap_url
    "#{Settings.openweathermap.uri}?APPID=#{Settings.openweathermap.api_token}"
  end
end
