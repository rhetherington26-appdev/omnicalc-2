class GeocodingController < ApplicationController

  def latlong
    render({ :template => "weather_templates/geocoding.html.erb"})
  end

  def getlatlong

    @address_from_user = params.fetch("user_street_address")

    gmaps_key = ENV.fetch("GMAPS_KEY")

    gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?&address=" + @address_from_user + "&key=" + gmaps_key
    
    @result = open(gmaps_url).read

    @parsed_data = JSON.parse(@result)

    @geometry = @parsed_data.fetch("results").at(0).fetch("geometry")
    @location = @geometry.fetch("location")

    @latitude = @location.fetch("lat")
    @longitude = @location.fetch("lng")

    render({ :template => "weather_templates/geocoding_results.html.erb"})
  end

  def weathercoords
    render({ :template => "weather_templates/weathercoords.html.erb"})
  end

  def getweathercoords

    @lat = params.fetch("lat")
    @long = params.fetch("long")

    darksky_key = ENV.fetch("DARK_SKY_KEY")

    darksky_url = "https://api.darksky.net/forecast/"+ darksky_key + "/" + @lat +"," + @long

    @result = open(darksky_url).read

    @parsed_data = JSON.parse(@result)

    @current_data = @parsed_data.fetch("currently")
    @current_temperature = @current_data.fetch("temperature")
    @current_summary = @current_data.fetch("summary")

    @minutely_data = @parsed_data.fetch("minutely")
    @minutely_outlook = @minutely_data.fetch("summary")

    @hourly_data = @parsed_data.fetch("hourly")
    @hourly_outlook = @hourly_data.fetch("summary")

    @daily_data = @parsed_data.fetch("daily")
    @daily_outlook = @daily_data.fetch("summary")

    render({ :template => "weather_templates/weathercoords_results.html.erb"})
  end

  def streetweather
    render({ :template => "weather_templates/streetweather.html.erb"})
  end

  def getstreetweather
    @address_from_user = params.fetch("user_street_address")

    gmaps_key = ENV.fetch("GMAPS_KEY")

    gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?&address=" + @address_from_user + "&key=" + gmaps_key
    
    @result = open(gmaps_url).read

    @parsed_data = JSON.parse(@result)

    @geometry = @parsed_data.fetch("results").at(0).fetch("geometry")
    @location = @geometry.fetch("location")

    @latitude = @location.fetch("lat")
    @longitude = @location.fetch("lng")

    @latitude = @latitude.to_s
    @longitude = @longitude.to_s

    darksky_key = ENV.fetch("DARK_SKY_KEY")

    darksky_url = "https://api.darksky.net/forecast/"+ darksky_key + "/" + @latitude +"," + @longitude

    @result = open(darksky_url).read

    @parsed_data = JSON.parse(@result)

    @current_data = @parsed_data.fetch("currently")
    @current_temperature = @current_data.fetch("temperature")
    @current_summary = @current_data.fetch("summary")

    @minutely_data = @parsed_data.fetch("minutely")
    @minutely_outlook = @minutely_data.fetch("summary")

    @hourly_data = @parsed_data.fetch("hourly")
    @hourly_outlook = @hourly_data.fetch("summary")

    @daily_data = @parsed_data.fetch("daily")
    @daily_outlook = @daily_data.fetch("summary")

    render({ :template => "weather_templates/streetweather_results.html.erb"})
  end

end
