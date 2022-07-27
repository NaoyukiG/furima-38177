FactoryBot.define do
  factory :purchase_management do
    association :user
    association :product
    token {"tok_abcdefghijk00000000000000000"}
  end
end
