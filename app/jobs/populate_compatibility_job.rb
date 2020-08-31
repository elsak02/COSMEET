class PopulateCompatibilityJob < ApplicationJob
  queue_as :default

  ASTRO_API = AstroService.new(ENV["ASTRO_ID"], ENV["ASTRO_KEY"])

  def perform(userone, usertwo)

    match_data = {
      sun_sign: userone.find_sign("Sun"),
      rising_sign: userone.find_sign("Ascendant"),
      partner_sun_sign: usertwo.find_sign("Sun"),
      partner_rising_sign: usertwo.find_sign("Ascendant")
    }
    api_compatibility = ASTRO_API.matchSigns(match_data)
    compatibility_parsed = JSON.parse(api_compatibility)
    # raise
    Compatibility.create!(
      user: userone,
      #user: usertwo,
      compatibility_description: compatibility_parsed["compatibility_report"],
      compatibility_score: compatibility_parsed["compatibility_percentage"]
    )
  end
end
