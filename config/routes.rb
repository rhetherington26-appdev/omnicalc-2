Rails.application.routes.draw do

get("/add", { :controller => "application", :action => "addition" })

get("/wizard_add", { :controller => "application", :action => "addition_result"})

get("/subtract", { :controller => "application", :action => "subtract" })

get("/wizard_subtract", { :controller => "application", :action => "subtract_result"})

get("/multiply", { :controller => "application", :action => "multiply" })

get("/wizard_multiply", { :controller => "application", :action => "multiply_result"})

get("/divide", { :controller => "application", :action => "divide" })

get("/wizard_divide", { :controller => "application", :action => "divide_result"})

get("/street_to_coords/new", { :controller => "geocoding", :action => "latlong"})

get("/street_to_coords/results", { :controller => "geocoding", :action => "getlatlong"})

get("/coords_to_weather/new", { :controller => "geocoding", :action => "weathercoords"})

get("/coords_to_weather/results", { :controller => "geocoding", :action => "getweathercoords"})

get("/street_to_weather/new", { :controller => "geocoding", :action => "streetweather"})

get("/street_to_weather/results", { :controller => "geocoding", :action => "getstreetweather"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
