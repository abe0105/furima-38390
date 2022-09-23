require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  it '全て正しく入力されれば登録できること' do
    expect(@user).to be_valid
  end

  it 'nicknameがないと登録できない' do
    @user.nickname = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Nickname can't be blank")
  end

  it 'メールアドレスがないと登録できない' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'メールアドレスが一意性でないと登録できない' do
    @user.save
    another_user = FactoryBot.build(:user, email: @user.email)
    another_user.valid?
    expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

  it 'メールアドレスは@がない登録できない' do
    @user.email = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Email is invalid')
  end

  it 'パスワードがないと登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'パスワードが5文字以下では登録できない' do
    @user.password = 'aaa'
    @user.password_confirmation = 'aaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end

  it 'パスワードは確認用を含めて2回入力しないと登録できない' do
    @user.password_confirmation = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it '英字のみのパスワードでは登録ができない' do
    @user.password = 'aaaaaa'
    @user.password_confirmation = 'aaaaaa'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
  end

  it '数字のみのパスワードでは登録できない' do
    @user.password = '111111'
    @user.password_confirmation = '111111'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
  end

  it '全角文字を含むパスワードでは登録できない' do
    @user.password = 'ああああああ'
    @user.password_confirmation = 'ああああああ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is invalid')
  end
  


  it '苗字がない場合は登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it '名前がない場合は登録できない' do
    @user.last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it '苗字は英語では入力できない' do
    @user.first_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include('First name Full-width characters')
  end

  it '氏名は英語では入力できない' do
    @user.last_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('Last name Full-width characters')
  end

  it '苗字カナがない場合は登録できない' do
    @user.kana_first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana first name can't be blank")
  end

  it '氏名カナがない場合は登録できない' do
    @user.kana_last_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Kana last name can't be blank")
  end

  it '苗字のフリガナは平仮名は使えない' do
    @user.kana_first_name = 'やまだ'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
  end

  it '苗字のフリガナは漢字は使えない' do
    @user.kana_first_name = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
  end

  it '苗字のフリガナは英語は使えない' do
    @user.kana_first_name = 'yamada'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana first name Full-width katakana characters')
  end

  it '氏名のフリガナは平仮名は使えない' do
    @user.kana_last_name = 'たろう'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
  end

  it '氏名のフリガナは漢字は使えない' do
    @user.kana_last_name = '太郎'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
  end

  it '氏名のフリガナは英語は使えない' do
    @user.kana_last_name = 'tarou'
    @user.valid?
    expect(@user.errors.full_messages).to include('Kana last name Full-width katakana characters')
  end

  it '生年月日がないと登録できない' do
    @user.birthday = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birthday can't be blank")
  end
end