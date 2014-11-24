require 'ostruct'
#require 'httparty'

class Query
  attr_reader   :results,
                :first_address,
                :second_address,
                :queries#, :radius

  def initialize(params)
    @results        = OpenStruct.new
    @queries        = params["query"]
    @first_address  = params["first_address"]
    @second_address = params["second_address"] 
#    @radius         = params["radius"]
  end

  def start
    queries.keys.each do |query|
      results[query] = self.send(query)
    end
    results
  end

  def crime
    radius = 0.2
    Crime.current_year.near(@first_address, radius)
  end

  def parks
    FourSquare.send_request(@first_address, 160, "park")
  end
  
#for each method name in @queries, create an http request to foursquare api
  
end

class FourSquare
  include HTTParty 
  format :json

  base_uri 'https://api.foursquare.com/v2/venues'
  default_params client_id: ENV["FOURSQUARE_ID"], 
                 client_secret: ENV["FOURSQUARE_SECRET"],
                 v: 20140806

  def self.send_request(address, radius, criteria)
    get("/search", query: { near: address, radius: radius, query: criteria })
  end
  # @queries.each do |query|
  #   add
end
