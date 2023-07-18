class WeatherController < ApplicationController

  def index
    if params[:location].present?
      response = HTTParty.get("https://api.weatherapi.com/v1/current.json?key=#{ENV['WEATHER_KEY']}&q=#{params[:location]}")
      weather_data = JSON.parse(response.body)
      debugger

      if response.code == 200 && weather_data.present?
        @weather_data = {
          temperature: weather_data['current']['temp_c'],
          conditions: weather_data['current']['condition']['text']
        }
      else
        @weather_data = {
          temperature: 'N/A',
          conditions: 'N/A'
        }
      end
    end
  end
end
