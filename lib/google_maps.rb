module GoogleMaps
  include HTTParty
  format :json

  base_uri 'https://maps.googleapis.com/maps/api'
  default_params key: "AIzaSyAvMFhD3Lm5BiylwzPgboV0vZFT0AwxmEY"

#  def self.fetch_street_view(location)
#    get("/streetview", query: {size: "500x200", location: location })
#  end
end
