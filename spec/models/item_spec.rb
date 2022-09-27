require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
  context '商品を出品できる' do

  it '全て正しく入力されれば出品ができること' do
    expect(@item).to be_valid
  end
end
end


   context '商品を出品できない' do
    it '画像がないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名がないと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明がないと登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーのプルダウンが---だと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Category select')
    end

    it '商品の状態についてのプルダウンが---だと登録できない' do
      @item.commodity_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Commodity condition select')
    end

    it '配送料の負担についてのプルダウンが---だと登録できない' do
      @item.shipping_charges_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping charges select')
    end

    it '発送元の地域についてのプルダウンが---だと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture select')
    end

    it '発送までの日数についてのプルダウンが---だと登録できない' do
      @item.days_to_ship_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('Days to ship select')
    end

    it '価格についての情報がないと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が300円以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '価格が9999999円以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it '販売価格は半角数字以外では登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end
    
    it 'userが紐づいていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
  end
end
end

