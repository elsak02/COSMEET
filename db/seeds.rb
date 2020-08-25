# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

astro_api = AstroService.new(ENV["ASTRO_ID"], ENV["ASTRO_KEY"])

#Geodetails from API -> to delete
# p astro_api.getResponse("geo_details", {
#   'place' => "paris",
#   'maxRows' => '3'
# })


# Get User charts and infos for each user

# Get Timezone
p timezone = astro_api.getResponse("timezone", {
  "country_code" => 'Europe/Paris',
  "isDst" => true,
}).to_f



# Get Coordinates from user address
# TODO: Write API call with Geocoder
latitude = User.first.latitude
longitude = User.first.longitude


# Get date and time infos as individual integers

date = User.first.birth_date.day
month = User.first.birth_date.month
year = User.first.birth_date.year
hour = User.first.birth_time.hour
minute = User.first.birth_time.strftime("%M")


# p astro_api.call("western_chart_data", date, month, year, hour, minute, latitude, longitude, -5)
# p astro_api.call("custom_western_chart", date, month, year, hour, minute, latitude, longitude, -5)

# exemple ocean
# oceane_file = astro_api.call("western_chart_data", 14, 03, 1989, 7, 10, 50.724, 3.162, 1)
# astro_api.call("custom_western_chart", 14, 03, 1989, 7, 10, 50.724, 3.162, 1)


# serialized_oceane = File.read(oceane_file)

# oceane = JSON.parse(serialized_oceane)

# p ascendant = oceane["houses"]

# exemple Louis
# louis = astro_api.call("western_chart_data", 20, 02, 1990, 5, 30, 48.8667, 2.2333, 2)
# astro_api.call("custom_western_chart", 20, 02, 1990, 5, 30, 48.8667, 2.2333, 2)
# cecile = astro_api.call("custom_western_chart", 29, 12, 1988, 5, 40, 49.043411, 3.956242, 2)


p maleBirthData = {'date' => 20, "month" => 02, "year" => 1990, "hour" => 5, "minute" => 30, "latitude" => 48.8667, "longitude" => 2.2333, "timezone" => 1.0}
p femaleBirthData = {'date' => 14, "month" => 03, "year" => 1989, "hour" => 7, "minute" => 10, "latitude" => 50.724, "longitude" => 3.162, "timezone" => 1.0}

match_data = {
  sun_sign: 'capricorn',
  rising_sign: 'scorpio',
  partner_sun_sign: 'pisces',
  partner_rising_sign: 'capricorn'
}

p astro_api.matchSigns(match_data)
p astro_api.matchMakingCall("love_compatibility_report/tropical", maleBirthData, femaleBirthData)
