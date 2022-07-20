FactoryBot.define do
  factory :product do
    title {Faker::Lorem.sentence}
    content {Faker::Lorem.sentence}
    category_id {Faker::Number.between(from:2, to: 3)}
    status_id {Faker::Number.between(from:2, to: 3)}
    charge_id {Faker::Number.between(from:2, to: 3)}
    prefacture_id {Faker::Number.between(from:2, to: 3)}
    shipping_day_id {Faker::Number.between(from:2, to: 3)}
    price {Faker::Number.number(digits: 4)}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
