FactoryBot.define do
  factory :item do
    name                      { 'test' }
    explanation               { 'test' }
    price                      { 1000 }
    category_id                  { 2 }
    commodity_condition_id       { 2 }
    shipping_charges_id          { 2 }
    prefecture_id                { 2 }
    days_to_ship_id              { 2 }

   after(:build) do |item|
      item.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
