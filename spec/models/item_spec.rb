require 'rails_helper'

RSpec.describe Item, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"#

  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができる時' do
     it '商品出品ができる時' do
       expect(@item).to be_valid
     end
    end
    context '商品出品ができない時' do
     it 'nameが空では出品できない' do
       @item.name = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Name can't be blank")
     end
     it 'imageが空では登録できない' do
       @item.image = nil
       @item.valid?
       expect(@item.errors.full_messages).to include("Image can't be blank")
     end
     it 'explanationが空では出品できない' do
       @item.explanation = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Explanation can't be blank")
     end
     it 'category_idが未選択の場合出品できない' do
       @item.category_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Category can't be blank")
     end
     it 'status_idが未選択の場合出品できない' do
       @item.status_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Status can't be blank")
     end
     it 'shipping_charge_idが未選択の場合出品できない' do
       @item.shipping_charge_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
     end
     it 'shipping_area_idが未選択の場合出品できない' do
       @item.shipping_area_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Shipping area can't be blank")
     end
     it 'delivery_time_idが未選択の場合出品できない' do
       @item.delivery_time_id = 1
       @item.valid?
       expect(@item.errors.full_messages).to include("Delivery time can't be blank")
     end
     it 'priceが空では出品できない' do
       @item.price = ''
       @item.valid?
       expect(@item.errors.full_messages).to include("Price 半角数字で入力してください")
     end
     it '価格が300円未満では出品できない' do
       @item.price = 200
       @item.valid?
       expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の間で入力してください")
     end

     it '価格が9_999_999円を超えると出品できない' do
       @item.price = 99999999
       @item.valid?
       expect(@item.errors.full_messages).to include("Price ¥300~¥9,999,999の間で入力してください")
     end

     it '販売価格は半角数字以外だと登録できない' do
       @item.price = '１０００'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price 半角数字で入力してください")
     end

     it '販売価格は半角英数混合では登録できない' do
       @item.price = '1000g'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price 半角数字で入力してください")
     end

     it '販売価格は半角英語だけでは登録できない' do
       @item.price = 'abcde'
       @item.valid?
       expect(@item.errors.full_messages).to include("Price 半角数字で入力してください")
     end
     
     it 'ユーザーが紐付いていなければ投稿できない' do
       @item.user = nil
       @item.valid?
       expect(@item.errors.full_messages).to include('User must exist')
     end
    end
  end
end
