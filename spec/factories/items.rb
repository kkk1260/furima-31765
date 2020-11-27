FactoryBot.define do
  factory :item do
    name                  { '商品' }
    information           { '商品の説明' }
    price                 { 500 }
    days_to_ship_id       { 2 }
    category_id           { 2 }
    delivery_price_id     { 2 }
    shipment_source_id    { 2 }
    condition_id          { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
