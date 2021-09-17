require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '商品購入' do
    context '商品購入ができる時' do
      it '商品購入ができる時' do
        expect(@order).to be_valid
      end
      it '建物名が空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入ができない時' do
      it 'user_idが空では購入できない' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'shipping_area_idが未選択の場合購入できない' do
        @order.shipping_area_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Shipping area can't be blank")
      end
        it 'municipalityが空では購入できない' do
          @order.municipality = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Municipality can't be blank")
        end
        it 'addressが空では購入できない' do
          @order.address = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Address can't be blank")
        end

        it 'phone_numberが空では購入できない' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end

        it 'postal_codeはハイフンがないと購入できない' do
          @order.postal_code = '1234567'
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code ハイフン,半角数字を入力してください")
        end

        it 'postal_codeは半角数字以外では購入できない' do
          @order.postal_code = '123-２３４５'
          @order.valid?
          expect(@order.errors.full_messages).to include("Postal code ハイフン,半角数字を入力してください")
        end

        it 'phone_numberは11桁より多いと購入できない' do
          @order.phone_number = '090123456789'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number 10,11桁半角数字を入力してください")
        end

        it 'phone_numberは9桁以下だとと購入できない' do
          @order.phone_number = '090123456'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number 10,11桁半角数字を入力してください")
        end

        it '電話番号に半角数字以外が含まれている場合は購入できない' do
          @order.phone_number = '0901234569７'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number 10,11桁半角数字を入力してください")
        end

        it "tokenが空では購入できないこと" do
          @order.token = nil
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end
    end
  end
end
