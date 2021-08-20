require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録ができる時' do
     it "ユーザー登録ができる時" do
       expect(@user).to be_valid
     end
    end
    context 'ユーザー登録ができない時' do
     it 'emailが＠を含んでいないと登録できない' do
      @user.email = 'abc.abc'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
     end
     it 'passwordが全角だと登録できない' do
       @user.password = 'アイウエオあ'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end
     it 'passwordが半角英字だけだと登録できない' do
       @user.password = 'asdfgh'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end
     it 'passwordが半角数字だけだと登録できない' do
       @user.password = '123455'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
     end
     it 'password_confirmationが空では登録できない' do
       @user.password_confirmation = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'passwordとpassword_confirmationが一致しないと登録できない' do
       @user.password_confirmation = '111111'
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
     it 'first_nameが空だと登録できない' do
       @user.first_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it 'last_nameが空だと登録できない' do
       @user.last_name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it 'first_nameが半角だと登録できない' do
       @user.first_name = 'ｱｲｳ'
       @user.valid?
       expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
     end
     it 'last_nameが半角だと登録できない' do
       @user.last_name = 'ｱｲｳ'
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
     end
     it 'furigana_fnが空だと登録できない' do
       @user.furigana_fn = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Furigana fn can't be blank")
     end
     it 'furigana_lnが空だと登録できない' do
       @user.furigana_ln = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Furigana ln can't be blank")
     end
     it 'furigana_lnが全角カタカナ以外だとだと登録できない' do
       @user.furigana_fn = 'あいう'
       @user.valid?
       expect(@user.errors.full_messages).to include("Furigana fn 全角文字を使用してください")
     end
     it 'furigana_lnが全角カタカナ以外だとだと登録できない' do
       @user.furigana_ln = 'あいう'
       @user.valid?
       expect(@user.errors.full_messages).to include("Furigana ln 全角文字を使用してください")
     end
     it 'birthdayが空だと登録できない' do
       @user.birthday = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
     it 'nameが空では登録できない' do
       @user.name = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Name can't be blank")
     end
     it 'emailが空では登録できない' do
       @user.email = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it 'passwordが空では登録できない' do
       @user.password = ''
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it '重複したemailが存在する場合登録できない' do
       @user.save
       another_user = FactoryBot.build(:user)
       another_user.email = @user.email
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
     end
     it 'passwordが5文字以下では登録できない' do
       @user.password = '00000'
       @user.encrypted_password = '00000'
       @user.valid?
       expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
     end
    end
  end
end
