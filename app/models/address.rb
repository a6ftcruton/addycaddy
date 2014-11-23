class Address 
  include ActiveModel::Validations

  attr_accessor :address, :city

  validates :city, 
            inclusion: { in: ["Denver"], message: "must be located in Denver." }, 
            if: 'address.present?'
  validates :address, presence: { message: " cannot be blank." } 

  def initialize(address)
    @address = address
  end

  def city
    Geocoder.search(@address).first.city
  end

  def address_in_denver?
    Geocoder.search(@address).first.city == "Denver"
  end

end
