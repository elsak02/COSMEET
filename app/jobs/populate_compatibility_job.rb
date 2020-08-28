class PopulateCompatibilityJob < ApplicationJob
  queue_as :default

ASTRO_API = AstroService.new(ENV["ASTRO_ID"], ENV["ASTRO_KEY"])

  def perform(user_1, user_2)

    match_data = {
  sun_sign: user_1.find_sign("Sun"),
  rising_sign: user_1.find_sign("ascendant"),
  partner_sun_sign: user_2.find_sign("Sun"),
  partner_rising_sign: user_2.find_sign("ascendant")
}
  api_compatibility = ASTRO_API.matchSigns(match_data)
  compatibility_parsed = JSON.parse(api_compatibility)
  compatibility_parsed["compatibility_report"]
  end
end
