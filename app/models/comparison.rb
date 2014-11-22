class Comparison < ActiveModel
  include ActiveModel::Validations
  
  attr_accessor :first_address
  validates :first_address, presence: true #format--call method to ensure geocoder can parse this address 
end
