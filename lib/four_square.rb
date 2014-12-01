module FourSquare
  include HTTParty 
  format :json

  base_uri 'https://api.foursquare.com/v2/venues'
  default_params client_id: ENV["FOURSQUARE_ID"], 
                 client_secret: ENV["FOURSQUARE_SECRET"],
                 output: 'json',
                 v: 20140806

  def self.send_request(address, radius, criteria)
    get("/search", query: { near: address, radius: radius, categoryId: criteria })
  end
  
end
