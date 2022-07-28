FactoryBot.define do
  factory :destination_purchase do
    postal_code { '123-4567' }
    prefacture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.state  }
    house_number { Faker::Address.city }
    building_name { Faker::Address.building_number }
    telephone_number { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
