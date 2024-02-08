FactoryBot.define do
  factory :order_residence do
    postal_code  { '000-0000' }
    region_id    { 2 }
    city         { '東京都' }
    house_number { '1-1' }
    building_name{ '東京ハイツ' }
    telephone    { '00000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end