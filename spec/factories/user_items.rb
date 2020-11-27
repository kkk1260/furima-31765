FactoryBot.define do
  factory :user_item do
    postal_code      { '123-4567' }
    prefecture       { 1 }
    municipality     { '横浜市緑区' }
    address          { '青山1-1-1' }
    building_name    { '東京ハイツ' }
    phone_number     { "0#{rand(0..9)}0#{rand(1_000_000..99_999_999)}" }
    token            { 'tok_abcdefghijk00000000000000000' }
    user_id          {1}
    item_id          {1}
  end
end
