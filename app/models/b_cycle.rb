class BCycle < ActiveRecord::Base
  validates :address, uniqueness: true, presence: true

  geocoded_by :address
  after_validation :geocode
  
end
