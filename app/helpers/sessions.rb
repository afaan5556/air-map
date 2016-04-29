helpers do

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def convert_address(street)
    a = Geokit::Geocoders::GoogleGeocoder.geocode(street)
    a.ll # returns the lat and lon for the address as a csv string
  end

  def call_api(location)
    lat = location.split(",")[0]
    lon = location.split(",")[1]
    key = "4a694c2e3544448baa9d166a4f82332f"
    request_string = "https://api.breezometer.com/baqi/?lat=#{lat}&lon=#{lon}&key=#{key}"
    # response = HTTParty.get(request_string)
  end
end
