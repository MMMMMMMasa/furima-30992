class Order
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :purchase, :token
 
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :user_id
    validates :item_id
    validates :token
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフンを入力してください' }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: '11桁以内で入力してください'}

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :shipping_area_id
  end

  def save
    # 各テーブルにデータを保存する処理を書く
    purchase = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    # 住所の情報を保存
    StreetAddress.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase.id)
  end
end