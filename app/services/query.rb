require 'ostruct'

class Query
  include FourSquare
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
    @radius         = params["radius"].to_f 
  end

  def start
    queries.keys.each do |query|
      results[query] = self.send(query)
    end
    results
  end

  def api_start
    results[queries] = self.send(queries)
  end

  def crimes
    first_address_results = Crime.near(@first_address, radius.to_f)
    second_address_results = Crime.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def parks
    first_address_results = Park.near(@first_address, radius.to_f)
    second_address_results = Park.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end
  
  def grocery_stores
    first_address_results = GroceryStore.near(@first_address, radius.to_f)
    second_address_results = GroceryStore.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def libraries
    first_address_results = Library.near(@first_address, radius.to_f)
    second_address_results = Library.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def restaurants
    first_address_results = Restaurant.near(@first_address, radius.to_f)
    second_address_results = Restaurant.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def bcycle_stations
    first_address_results = BCycle.near(@first_address, radius.to_f)
    second_address_results = BCycle.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end
  
  def bars
    first_address_results = Bar.near(@first_address, radius.to_f)
    second_address_results = Bar.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def coffee_shops
    first_address_results = CoffeeShop.near(@first_address, radius.to_f)
    second_address_results = CoffeeShop.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def museums
    first_address_results = Museum.near(@first_address, radius.to_f)
    second_address_results = Museum.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end
 
  def liquor_stores
    first_address_results = LiquorStore.near(@first_address, radius.to_f)
    second_address_results = LiquorStore.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

   def pharmacies
    first_address_results = Pharmacy.near(@first_address, radius.to_f)
    second_address_results = Pharmacy.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def bus_stops
    first_address_results = BusStop.near(@first_address, radius.to_f)
    second_address_results = BusStop.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def light_rail_stops
    first_address_results = LightRailStop.near(@first_address, radius.to_f)
    second_address_results = LightRailStop.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def theaters
    first_address_results = Theater.near(@first_address, radius.to_f)
    second_address_results = Theater.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def movies
    first_address_results = Movie.near(@first_address, radius.to_f)
    second_address_results = Movie.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end

  def live_music
    first_address_results = LiveMusic.near(@first_address, radius.to_f)
    second_address_results = LiveMusic.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end 

  def art_galleries
    first_address_results = ArtGallery.near(@first_address, radius.to_f)
    second_address_results = ArtGallery.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end 

  def hardware_stores
    first_address_results = HardwareStore.near(@first_address, radius.to_f)
    second_address_results = HardwareStore.near(@second_address, radius.to_f)
    [first_address_results, second_address_results]
  end 
  
end
