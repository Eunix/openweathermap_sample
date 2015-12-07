class WeatherController < ApplicationController
  def index
    unless params[:city].blank?
      @weather = Weather.new(country: params[:country], city: params[:city])
    end
  end
end
