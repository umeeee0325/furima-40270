FactoryBot.define do
  factory :item do
    item_name             { 'Example Item' }
    explanation           { 'This is an example item.' }
    category_id           { 2 }
    status_id             { 2 }
    charge_id             { 2 }
    region_id             { 2 }
    shipping_day_id       { 2 }
    price                 { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
