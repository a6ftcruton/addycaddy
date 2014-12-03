class ApiRequestJob
  @queue = :api_request

  def self.perform(params)
    Query.new(params).start   
  end

end
