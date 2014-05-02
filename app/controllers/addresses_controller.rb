require 'open-uri'
require 'json'

class AddressesController < ApplicationController
  def fetch_coordinates
    @address = "the corner of Foster and Sheridan"
    @url_safe_address = URI.encode(@address)

    #result = JSON.parse(open(http://maps.googleapis.com/maps/api/geocode/json?address=the+corner+of+Foster+and+Sheridan&sensor=false))


    url = "http://maps.googleapis.com/maps/api/geocode/json?address=the+corner+of+Foster+and+Sheridan&sensor=false"

    raw_data = open(url).read

    parsed_data = JSON.parse(raw_data)
    results = parsed_data["results"]
    first = results[0]
    geometry = first["geometry"]
    location = geometry["location"]
    @latitude = location["lat"]
    @longitude = location["lng"]

  end
end
