class PopulateCompatibilityJob < ApplicationJob
  queue_as :default

  ASTRO_API = AstroService.new(ENV["ASTRO_ID"], ENV["ASTRO_KEY"])

  def perform(userone, usertwo)

    timezone = 2
    latitude = userone.latitude
    longitude = userone.longitude
    date = userone.birth_date.day
    month = userone.birth_date.month
    year = userone.birth_date.year
    hour = userone.birth_time.hour
    minute = userone.birth_time.strftime("%M")

    userone_birth_data = {'date' => date, "month" => month, "year" => year, "hour" => hour, "minute" => minute, "latitude" => latitude, "longitude" => longitude, "timezone" => timezone}

    timezone = 2
    latitude = usertwo.latitude
    longitude = usertwo.longitude
    date = usertwo.birth_date.day
    month = usertwo.birth_date.month
    year = usertwo.birth_date.year
    hour = usertwo.birth_time.hour
    minute = usertwo.birth_time.strftime("%M")

    usertwo_birth_data = {'date' => date, "month" => month, "year" => year, "hour" => hour, "minute" => minute, "latitude" => latitude, "longitude" => longitude, "timezone" => timezone}

    content_compat = ASTRO_API.matchMakingCall("love_compatibility_report/tropical", userone_birth_data, usertwo_birth_data)
    content_compat_parsed = JSON.parse(content_compat)
    return content_compat_parsed["love_report"].first
  end
end
