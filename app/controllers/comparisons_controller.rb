class ComparisonsController < ApplicationController

  def new
  end
  
  def show
    @first_address = Address.new(params["first_address"])
    @results = Query.new(params).start
    if !@first_address.valid?
      flash[:notice] = "Your address is invalid"
      render action: 'new'
    end
  end

end
