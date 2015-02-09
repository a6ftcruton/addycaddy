require 'rails_helper'

RSpec.describe Address, :type => :model do
  attr_reader :address

  before do
    @address = build(:address)
  end

  it 'is valid' do
    expect(address).to be_valid
  end

  it 'has a city' do
    address = build(:address, address: "1550 Blake St Denver, CO 80206")
    city = address.city 
    expect(city).to eq "Denver"
  end

  it 'is invalid if not in City and County of Denver' do
    not_in_denver = Address.new("205 Duchess Dr. Cary, NC")
    expect(not_in_denver).to_not be_valid
  end

  it 'is invalid if not an address' do
    vague_address = Address.new("123 Sesame")
    expect(vague_address).to_not be_valid
  end
end
