class Address 
  include ActiveModel::Validations

  attr_accessor :address

  validates :address, presence: true

  def initialize(address)
    @address = address
  end

  def geocodable?
    
  end

end
