class ComparisonsController < ApplicationController

  def new
  end
  
  def show
    @first_address = Address.new(params["first_address"])
    if @first_address.invalid?
      flash[:notice] = "Your address is invalid"
      render action: 'new'
    elsif Query.new(params).queries.nil? 
      flash[:notice] = "You must choose at least one criteria for your comparison."
      render action: 'new'
    else
      @results = Query.new(params).start
    end
  end

end
