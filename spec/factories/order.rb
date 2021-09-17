FactoryBot.define do
  factory :order do
    postal_code          {'123-4567'}
    shipping_area_id     {2}
    municipality         {'豊島区'}
    address              {'あいう１−３−５'}
    building_name        {'アイウエオ１０１'}
    phone_number         {'09012345677'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
