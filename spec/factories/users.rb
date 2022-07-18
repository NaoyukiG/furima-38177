FactoryBot.define do
  factory :user do
    nickname {'田山'}
    email {'testtest@test'}
    password {'test12'}
    password_confirmation {password}
    family_name {'山田'}
    first_name {'太郎'}
    family_name_reading {'ヤマダ'}
    first_name_reading {'タロウ'}
    birth_date {'1999-01-01'}
  end
end
