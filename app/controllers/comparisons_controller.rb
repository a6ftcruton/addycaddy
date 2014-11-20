class ComparisonsController < ApplicationController

  def new
  end
  
  def show
#    @results = Query.new(params).start
    @first_address = params["first_address"]
    @second_address = params["second_address"]
    queries = params["query"].keys 
    @queries = queries.each do |query|
      query
    end
  end
end
