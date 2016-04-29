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
    api_key = "4a694c2e3544448baa9d166a4f82332f"
    # widget_key = "00691e75361e66e8bce2de9ef4698ee5a930b6b2"

    request_string = "http://api.breezometer.com/baqi/?lat=#{lat}&lon=#{lon}&key=#{api_key}"
    response = HTTParty.get(request_string)
    # puts "******************************************"
    # puts response.parsed_response['country_name']
    # puts "******************************************"

    # response

  end
end
