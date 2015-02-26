class ComparisonsController < ApplicationController
  include GoogleMaps
  respond_to :json, :xml

#  before_filter :authenticate 
  attr_reader :first_address, :second_address

  def new
  end
  
  def show
    @first_address = Address.new(params["first_address"])
    @second_address = Address.new(params["second_address"])
    #FIX (move to model?)
    @street_view = GoogleMaps.fetch_street_view(params["first_address"])

    if @first_address.invalid?
      flash[:notice] = @first_address.errors.full_messages
      redirect_to :back    
    elsif Query.new(params).queries.nil? 
      flash[:notice] = "You must choose at least one criteria for your comparison."
      redirect_to comparisons_new_path(request.params)
    else
      @queries = params["query"].keys
      @results = Query.new(params).start
    end
  end

end
