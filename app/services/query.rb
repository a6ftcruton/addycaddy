require 'ostruct'

class Query

  attr_reader   :results,
                :first_address,
                :second_address,
                :queries, 
                :radius

  def initialize(params)
    @results        = OpenStruct.new
    @queries        = params["query"]
    @first_address  = params["first_address"]
    @second_address = params["second_address"] 
    @radius         = params["radius"].to_f #removed .to_f
  end

  def start
    queries.keys.each do |query|
      results[query] = self.send(query)
    end
    results
  end

  def crimes
    Crime.current_year.near(@first_address, radius.to_f)
  end

  def parks
    category_id = "4bf58dd8d48988d163941735"
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end
  
  def grocery_stores
    category_id = '4bf58dd8d48988d118951735'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def libraries
    category_id = '4bf58dd8d48988d12f941735'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end
  
  def restaurants
    category_id = '4d4b7105d754a06374d81259'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def bcycle_stations
    category_id = '4e4c9077bd41f78e849722f9'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end
  
  def bars
    category_id = '4bf58dd8d48988d11b941735,4bf58dd8d48988d121941735,4bf58dd8d48988d118941735'
  response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def coffee_shops
    category_id = '4bf58dd8d48988d1e0931735'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def museums
    category_id = '4bf58dd8d48988d181941735'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end
 
  def liquor_stores
    category_id = '4bf58dd8d48988d186941735' 
  response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

   def pharmacies
    category_id = '4bf58dd8d48988d10f951735' 
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def bus_stops
    category_id = '52f2ab2ebcbc57f1066b8b4f' 
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def light_rail_stops
    category_id = '52f2ab2ebcbc57f1066b8b4f' 
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def theaters
    category_id = '4bf58dd8d48988d137941735,4bf58dd8d48988d135941735,4bf58dd8d48988d1ac941735' 
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def movies
    category_id = '4bf58dd8d48988d17f941735' 
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end

  def live_music
    category_id = '4bf58dd8d48988d1e5931735'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end 

  def art_galleries
    category_id = '4bf58dd8d48988d1e2931735'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end 

  def hardware_stores
    category_id = '4bf58dd8d48988d112951735'
    response = FourSquare.send_request(@first_address, radius_to_meters, category_id)["response"]
    response["venues"]
  end 
  
  def radius_to_meters
    (radius * 1600).to_i
  end

end

class FourSquare
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
