class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase, :token
 
  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフン,半角数字を入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '10,11桁で入力してください'}

  validates :shipping_area_id , numericality: { other_than: 1 , message: "shipping area can't be blank"}

  def save
    purchase = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    StreetAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase.id)
  end
end