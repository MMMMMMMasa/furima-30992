class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_time
  belongs_to :shipping_area
  belongs_to :shipping_charge
  belongs_to :status

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :shipping_charge_id
    validates :shipping_area_id
    validates :delivery_time_id
  end

  validates :price, numericality: { with: /\A[0-9]+\z/, message: '半角数字で入力してください' }
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '¥300~¥9,999,999の間で入力してください' }
end
