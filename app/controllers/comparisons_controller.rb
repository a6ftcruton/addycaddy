class ComparisonsController < ApplicationController

  def new
  end
  
  def show
    if @comparison.valid?
    @first_address = params["first_address"]
    @results = Query.new(params).start
  end
end
