FactoryBot.define do
  factory :order_address do
    token { 'abcdefg1234567'}
    postal_code { '123-4567'}
    prefecture_id { '4'}
    city { '大阪府'}
    house_num { '1-1'}
    building_name { 'テスト'}
    phone { '09012345678'}
  end
end
