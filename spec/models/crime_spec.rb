require 'rails_helper'

RSpec.describe Crime, :type => :model do
  attr_reader :crime

  before do
    @crime = create(:crime)
  end

  it 'is valid' do
    expect(crime).to be_valid
  end

  it 'converts string date' do
    crime.date = "2014-07-11 12:43:13"
    expect(crime).to be_valid

    expect(crime.date).to eq "Fri, 11 Jul 2014 12:43:13 UTC +00:00"
  end
end
