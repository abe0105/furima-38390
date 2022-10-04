require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
  context '新規登録ができるとき' do

  it '全て正しく入力されれば登録できること' do
    expect(@user).to be_valid
  end
end
end


   context '新規登録できないとき' do
  it 'nicknameがないと登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("ニックネームを入力してください")
  end

  it 'メールアドレスがないと登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Eメールを入力してください")
  end

  it 'メールアドレスが一意性でないと登録できない' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
  end

  it 'メールアドレスは@がない登録できない' do
    @user.email = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Eメールは不正な値です')
  end

  it 'パスワードがないと登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワードを入力してください")
  end

  it 'パスワードが5文字以下では登録できない' do
    @user.password = 'aaa'
    @user.password_confirmation = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
  end

  it 'パスワードは確認用を含めて2回入力しないと登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
  end

  it '英字のみのパスワードでは登録ができない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは不正な値です')
  end

  it '数字のみのパスワードでは登録できない' do
    @user.password = '111111'
    @user.password_confirmation = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは不正な値です')
  end

  it '全角文字を含むパスワードでは登録できない' do
    @user.password = 'ああああああ'
    @user.password_confirmation = 'ああああああ'
    @user.valid?
    expect(@user.errors.full_messages).to include('パスワードは不正な値です')
  end
  


  it '苗字がない場合は登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("苗字を入力してください")
  end

  it '名前がない場合は登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("名前を入力してください")
  end

  it '苗字は英語では入力できない' do
    @user.first_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include('苗字を全角文字で入力してください')
  end

  it '氏名は英語では入力できない' do
    @user.last_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('名前を全角文字で入力してください')
  end

  it '苗字カナがない場合は登録できない' do
    @user.kana_first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
  end

  it '氏名カナがない場合は登録できない' do
    @user.kana_last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
  end

  it '苗字のフリガナは平仮名は使えない' do
    @user.kana_first_name = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include('苗字（カナ）を全角文字で入力してください')
  end

  it '苗字のフリガナは漢字は使えない' do
    @user.kana_first_name = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include('苗字（カナ）を全角文字で入力してください')
  end

  it '苗字のフリガナは英語は使えない' do
    @user.kana_first_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include('苗字（カナ）を全角文字で入力してください')
  end

  it '氏名のフリガナは平仮名は使えない' do
    @user.kana_last_name = 'たろう'
    @user.valid?
    expect(@user.errors.full_messages).to include('名前（カナ）を全角文字で入力してください')
  end

  it '氏名のフリガナは漢字は使えない' do
    @user.kana_last_name = '太郎'
    @user.valid?
    expect(@user.errors.full_messages).to include('名前（カナ）を全角文字で入力してください')
  end

  it '氏名のフリガナは英語は使えない' do
    @user.kana_last_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('名前（カナ）を全角文字で入力してください')
  end

  it '生年月日がないと登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("誕生日を入力してください")
  end
end
end