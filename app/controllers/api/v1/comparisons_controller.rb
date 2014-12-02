class Api::V1::ComparisonsController < Api::V1::BaseController
  respond_to :json
  
  def index
    first_address = Address.new(params["first_address"])
    second_address = Address.new(params["second_address"])
    if first_address.invalid?
      render json: { errors: first_address.errors.full_messages }, status: 422 
    elsif Query.new(params).queries.nil? 
      render json: { errors: first_address.errors.full_messages }, status: 422 
    else
      @results = Query.new(params).api_start
      render json: JSON.pretty_generate(@results)
    end
  end

end
