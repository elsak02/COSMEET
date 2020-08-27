require 'net/http'
require 'uri'

class AstroService
  @@baseURL = "http://api.vedicrishiastro.com/v1/"
  def initialize(uid = nil, key = nil)
    @userID = uid
    @apiKey = key
  end

  def display()
    return {
      'userid' => @userID,
      'key' => @apiKey
    }
  end

  def getResponse(resource, data = nil)
    url = URI.parse(@@baseURL+ resource)
    req = Net::HTTP::Post.new(url)
    req.basic_auth @userID, @apiKey
    if data
      req.set_form_data(data)
      resp = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
    else
      resp = Net::HTTP.new(url.host, url.port).start {|http| http.request(req) }
    end
      resp.body
  end

  def packageHoroData(date, month, year, hour, minute, latitude, longitude, timezone)
    return {
      'day' => date,
      'month' => month,
      'year' => year,
      'hour' => hour,
      'min' => minute,
      'lat' => latitude,
      'lon' => longitude,
      'tzone' => timezone
    }
  end

  def packageNumeroData(date, month, year, name)
    return {
      'day' => date,
      'month' => month,
      'year' => year,
      'name' => name
    }
  end

  def packageMatchMakingData(maleBirthData, femaleBirthData)
    mData = {
      'p_day'=> maleBirthData['date'],
      'p_month'=> maleBirthData['month'],
      'p_year'=> maleBirthData['year'],
      'p_hour'=> maleBirthData['hour'],
      'p_min'=> maleBirthData['minute'],
      'p_lat'=> maleBirthData['latitude'],
      'p_lon'=> maleBirthData['longitude'],
      'p_tzone'=> maleBirthData['timezone']
    }

    fData = {
        's_day'=> femaleBirthData['date'],
        's_month'=> femaleBirthData['month'],
        's_year'=> femaleBirthData['year'],
        's_hour'=> femaleBirthData['hour'],
        's_min'=> femaleBirthData['minute'],
        's_lat'=> femaleBirthData['latitude'],
        's_lon'=> femaleBirthData['longitude'],
        's_tzone'=> femaleBirthData['timezone']
    }

    return mData.merge(fData)
  end

  def call(resource, date, month, year, hour, minute, latitude, longitude, timezone)
    data = self.packageHoroData(date, month, year, hour, minute, latitude, longitude, timezone)
    getResponse(resource,data)
  end

  def matchMakingCall(resource, maleBirthData, femaleBirthData)
    data = self.packageMatchMakingData(maleBirthData, femaleBirthData)
    getResponse(resource, data)
  end

  def numeroCall(resource, date, month, year, name)
    data = self.packageNumeroData(date, month, year, name)
    getResponse(resource, data)
  end

  def matchSigns(data)
    url = "compatibility/#{data[:sun_sign]}/#{data[:rising_sign]}/#{data[:partner_sun_sign]}/#{data[:partner_rising_sign]}"
    getResponse(url)
  end
end
