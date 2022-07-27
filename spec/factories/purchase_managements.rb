FactoryBot.define do
  factory :purchase_management do
    association :product
    user { product.user }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
