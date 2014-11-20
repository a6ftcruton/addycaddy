require 'ostruct'

class Query
  attr_accessor :radius #allow user to change/set search radius
  attr_reader :results,
              :queries, 
              :first_address,
              :second_address

  def initialize(params)
    @results        = OpenStruct.new
    @queries        = params["query"].keys
    @first_address  = params["first_address"]
    @second_address = params["second_address"] 
  end

  def start
    queries.each do |query|
      results[query] = self.send(query)
    end
    results
  end

  def crime
    radius = 0.2
    Crime.current_year.near(@first_address, radius)
  end

  def parks
    # park methods
  end
end
