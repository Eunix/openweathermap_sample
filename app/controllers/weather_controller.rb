class WeatherController < ApplicationController
  def index
    if params[:city]
      @weather = Weather.new(country: params[:country], city: params[:city])
    end
  end
end
