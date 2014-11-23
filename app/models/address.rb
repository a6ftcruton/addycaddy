class Address 
  include ActiveModel::Validations

  attr_accessor :address, :zipcode

  validates :address, presence: true
#  validates :zipcode, with: in_denver? 

  def initialize(address)
    @address = address
  end

  def zip_code
    @zipcode = @address.match(/\d{5}(-\d{4})?/) 
  end

#  def in_denver?
#     @zipcode 
#  end

end
