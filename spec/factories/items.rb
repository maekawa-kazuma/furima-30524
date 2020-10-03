FactoryBot.define do
  factory :item do
    name {Faker::Name.name}
    text {Faker::Lorem.sentence}
    category { Category.all.sample}
    state { State.all.sample}
    burden { Burden.all.sample}
    area { Area.all.sample}
    day { Day.all.sample}
    price { "1000" }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
