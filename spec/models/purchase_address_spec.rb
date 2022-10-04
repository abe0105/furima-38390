require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@purchase_address).to be_valid
      end
      it '建物名は空でも保存できること' do
        @purchase_address.building_name = ''
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'クレジットカード情報が空では保存できない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '郵便番号が空では保存できない' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号に3桁目と4桁目の間にハイフンが含まれていないと保存できない' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it '発送元の地域が選択されていないと保存できない' do
        @purchase_address.prefecture_id = 0
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '市区町村が空では保存できない' do
        @purchase_address.municipality = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地が空では保存できない' do
        @purchase_address.address = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号が空では保存できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号にハイフンが含まれていると保存できない' do
        @purchase_address.phone_number = '111-1111-1111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が9桁以下では保存できない' do
        @purchase_address.phone_number = '123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上では保存できない' do
        @purchase_address.phone_number = '123456789012'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'userが紐付いていないと保存できない' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できない' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end