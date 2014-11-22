class ComparisonsController < ApplicationController

  def new
  end
  
  def show
    @first_address = Address.new(params["first_address"])
    @results = Query.new(params).start
    if @first_address.valid?
      flash[:notice] = "This appears to be valid!"
    else
      flash[:notice] = "Your address is invalid"
      render action: 'new'
    end
  end

#  def show
#    @first_address = params["first_address"]
#    @results = Query.new(params).start
#  end
end
