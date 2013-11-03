FactoryGirl.define do
  factory :guess do
    speed 68
    speed_limit 55
    city "New York"
    state "NY"
  end
  
  factory :guess_template do
    latitude 40.7143528
    longitude -74.0059731
    address "New York, NY, USA"
    state "New York"
    state_code "NY"
    country "United States"
    country_code "US"
    speed 68
    speed_limit 55
  end
  
  factory :nearby_guess do
    speed 75
    speed_limit 85
    address "Brooklyn, NY"
  end
  
end