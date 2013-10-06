require 'factory_girl'

FactoryGirl.define do
  factory :item do
    title "Fire And Ice Feuer"
    description "Eisterne und Feuerblumen. Die wei&szlig;en "
    price 34.99
    image_link "http://www.arenablumen.de/product_image/large/16430-fire_and_ice.jpg"
    currency "EUR"
    country "GB"
  end

  factory :session do
  end
end 
