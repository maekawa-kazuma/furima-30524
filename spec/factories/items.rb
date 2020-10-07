FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    text { Faker::Lorem.sentence }
    category_id { 2 }
    state_id { 2 }
    burden_id { 2 }
    area_id { 2 }
    day_id { 2 }
    price { '1000' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
