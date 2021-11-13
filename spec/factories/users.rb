FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    Kanji_last_name { '山田' }
    Kanji_first_name { '太郎' }
    Kana_last_name { 'ヤマダ' }
    Kana_first_name { 'タロウ' }
    birthday { '1999-10-10' }
  end
end
