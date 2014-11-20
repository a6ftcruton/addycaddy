class ComparisonsController < ApplicationController

  def new
  end
  
  def show
    @first_address = params["first_address"]
    @second_address = params["second_address"]
  end
end
