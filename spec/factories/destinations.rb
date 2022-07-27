FactoryBot.define do
  factory :destination do
    postal_code { 123-4567 }
    prefacture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.state  }
    house_number { Faker::Address.city }
    building_name { Faker::Address.building_number }
    telephone_number { 19012345678 }
    association :purchase_management
  end
end
