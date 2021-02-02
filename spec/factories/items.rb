FactoryBot.define do
  factory :item do
    product_name     { '商品名' }
    text             { '商品の説明' }
    category_id      { 1 }
    product_state_id { 1 }
    delivery_fee_id  { 1 }
    area_id          { 1 }
    day_id           { 1 }
    price            { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
