FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code              { '111-1111' }
    prefecture_id          { 2 }
    municipality           { '清田区' }
    address                { '清田1-1-1' }
    building_name          { '清田101' }
    phone_number           { '1234567890' }
  end
end