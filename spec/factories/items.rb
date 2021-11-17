FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    explanation {Faker::Lorem.sentence}
    prefecture_id { Faker::Number.between(from: 2, to: 48)}
    delivery_fee_id { Faker::Number.between(from: 2, to: 3)}
    category_id { Faker::Number.between(from: 2, to: 11)}
    status_id { Faker::Number.between(from: 2, to: 7)}
    ship_day_id { Faker::Number.between(from: 2, to: 4)}
    price { Faker::Number.between(from: 300, to: 9999999)}
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

