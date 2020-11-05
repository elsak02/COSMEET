require 'json'
require "open-uri"

class PopulateChartElementJob < ApplicationJob
  queue_as :default

PLANETS = %w[Sun Moon Saturn Jupiter Venus Mercury Pluto Uranus Neptune Mars]

ASTRO_API = AstroService.new(ENV["ASTRO_ID"], ENV["ASTRO_KEY"])

  def perform(user)
    # raise
    timezone = 1
    latitude = user.latitude
    longitude = user.longitude
    date = user.birth_date.day
    month = user.birth_date.month
    year = user.birth_date.year
    hour = user.birth_time.hour
    minute = user.birth_time.strftime("%M")

    # //PLANETS//
    api_user = ASTRO_API.call("western_chart_data", date, month, year, hour, minute, latitude, longitude, timezone)
    user_parsed = JSON.parse(api_user)
    user_parsed["houses"].each do |house|
      house["planets"].each do |planet|
        next unless PLANETS.include?(planet["name"])
        api_content_planet = ASTRO_API.call("general_sign_report/tropical/#{planet["name"]}", date, month, year, hour, minute, latitude, longitude, timezone)
        content_parsed = JSON.parse(api_content_planet)
        ChartElement.create!(user: user, planet: planet["name"], sign: planet["sign"], content: content_parsed["report"])
      end
    end

    # //ASCENDANT//
      api_content_ascendant = ASTRO_API.call("general_ascendant_report/tropical", date, month, year, hour, minute, latitude, longitude, timezone)
      content_parsed_ascendant = JSON.parse(api_content_ascendant)
      ChartElement.create!(user: user, planet: "Ascendant", sign: user_parsed["houses"][0]["sign"], content: content_parsed_ascendant["report"])


    # //CHART//
      api_chart = ASTRO_API.call("custom_western_chart", date, month, year, hour, minute, latitude, longitude, timezone)
      chart_parsed = JSON.parse(api_chart)
      chart_url = chart_parsed["url"]
      file = URI.open(chart_url)
      user.chart.attach(io: file, filename: 'chart.png', content_type: 'image/png')

  end
end
