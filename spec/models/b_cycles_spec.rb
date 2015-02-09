require 'rails_helper'

RSpec.describe BCycle, :type => :model do
  it 'find bcycle' do
    bcycle = Bcycle.create(address: build(:address_in_denver))
    expect(bcycle.calculate_lat_lon).to eq([45.6, 120.9])
  end
end
