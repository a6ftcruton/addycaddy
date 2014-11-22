FactoryGirl.define do
  factory :address do
    address "1550 Blake St Denver, CO 80206"

    initialize_with { new(address) }
  end
end
