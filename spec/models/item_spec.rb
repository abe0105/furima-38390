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
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it '商品名がないと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '商品の説明がないと登録できない' do
      @item.explanation = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'カテゴリーのプルダウンが---だと登録できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーを選択してください')
    end

    it '商品の状態についてのプルダウンが---だと登録できない' do
      @item.commodity_condition_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('商品状態を選択してください')
    end

    it '配送料の負担についてのプルダウンが---だと登録できない' do
      @item.shipping_charges_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担を選択してください')
    end

    it '発送元の地域についてのプルダウンが---だと登録できない' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域を選択してください')
    end

    it '発送までの日数についてのプルダウンが---だと登録できない' do
      @item.days_to_ship_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数を選択してください')
    end

    it '価格についての情報がないと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を入力してください")
    end

    it '価格が300円以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格の設定範囲外の値段です')
    end

    it '価格が9999999円以上だと登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('販売価格の設定範囲外の値段です')
    end

    it '販売価格は半角数字以外では登録できない' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格を半角数字で入力してください")
    end
    
    it 'userが紐づいていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Userを入力してください")
  end
end
end

