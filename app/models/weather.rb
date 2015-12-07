class Weather
  require 'open-uri'

  include ActiveModel::Model

  attr_accessor :country, :city

  def temperature
    openweathermap.to_h['main'].to_h['temp']
  end

  def humidity
    openweathermap.to_h['main'].to_h['humidity']
  end

  def pressure
    openweathermap.to_h['main'].to_h['pressure']
  end

  def wind
    openweathermap.to_h['wind'].to_h['speed']
  end

  def clouds
    openweathermap.to_h['clouds'].to_h['all']
  end

  def fetched?
    !temperature.nil?
  end

  private

  def openweathermap
    @openweathermap ||= JSON.load(open("#{openweathermap_url}&q=#{city},#{country}&units=metric"))
  end

  def openweathermap_url
    "#{Settings.openweathermap.uri}?APPID=#{Settings.openweathermap.api_token}"
  end
end
