FactoryGirl.define do
  factory :manufacturer do
    sequence(:name) { |n| "Manufacturer #{n}" }
    country "USA"
  end

  factory :car do
    sequence(:color) { |n| "Blue#{n}" }
    year 1987
    mileage 983243
    description "This car is awesome!"
  end
end
