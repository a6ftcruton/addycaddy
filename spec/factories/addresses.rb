FactoryGirl.define do
  factory :address do
    address "1550 Blake St Denver, CO 80206"
#    zip 1111
    
    initialize_with { new(address) }
  end

#  factory :address_in_denver, class: 'Address' do
#    address "1550 Blake St Denver, CO 80206"
#  end

end
