class ComparisonsController < ApplicationController
#  before_filter :authenticate_user!
  attr_reader :first_address

  def new
  end
  
  def show
    @first_address = Address.new(params["first_address"])
    if @first_address.invalid?
      flash[:notice] = @first_address.errors.full_messages
      redirect_to :back    
    elsif Query.new(params).queries.nil? 
      flash[:notice] = "You must choose at least one criteria for your comparison."
      redirect_to comparisons_new_path(request.params)
    else
      @queries = params["query"].keys
      @results = Query.new(params).start
      # eventually this will be CategoryRating and AddressRating
      @rating = CriteriaRating.new(@first_address.address, params["radius"])

#      raise @results.inspect
    end
  end

end
