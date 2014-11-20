require 'ostruct'

class Query
  attr_reader :queries, :first_address, :second_address

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
    Crime.current_year.near(@first_address, 1)
  end

  def parks
  end
end
