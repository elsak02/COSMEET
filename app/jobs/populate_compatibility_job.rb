class PopulateCompatibilityJob < ApplicationJob
  queue_as :default

  ASTRO_API = AstroService.new(ENV["ASTRO_ID"], ENV["ASTRO_KEY"])

  def perform(userone, usertwo)

    match_data = {
      sun_sign: userone.find_sign("Sun")&.downcase,
      rising_sign: userone.find_sign("Ascendant")&.downcase,
      partner_sun_sign: usertwo.find_sign("Sun")&.downcase,
      partner_rising_sign: usertwo.find_sign("Ascendant")&.downcase
    }

    api_compatibility = ASTRO_API.matchSigns(match_data)
    compatibility_parsed = JSON.parse(api_compatibility)
    Compatibility.create!(
      user: userone,
      receiver: usertwo,
      compatibility_description: compatibility_parsed["compatibility_report"] || "",
      compatibility_score: compatibility_parsed["compatibility_percentage"] || 0
    )
  end
end
