require 'csv'
require 'net/http'

class CSVImporter
  attr_reader :uri 

  def initialize(uri)
    @uri = uri
  end

  def read_file
    Net::HTTP.get(uri) 
  end
  
end

