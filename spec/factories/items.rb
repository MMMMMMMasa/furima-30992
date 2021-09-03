FactoryBot.define do
  factory :item do
    name                {'test'}
    explanation         {'testestestestestes'}
    category_id         {2}
    status_id           {2}
    shipping_charge_id  {2}
    shipping_area_id    {2}
    delivery_time_id    {2}
    price               {3000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
