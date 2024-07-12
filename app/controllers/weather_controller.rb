require_relative '../../lib/services/weather_api'


class WeatherController < ApplicationController
  def index
    weather_api = WeatherAPI.new(ENV['OPENWEATHERMAP_API_KEY'])
    response = weather_api.current_weather(params[:city] || 'London')
    Rails.logger.debug("Weather API response: #{response.inspect}")
    @weather = weather_api.current_weather(params[:city] || 'London')
  end
end
