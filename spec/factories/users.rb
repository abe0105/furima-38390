FactoryBot.define do

  factory :user do
    nickname              { "テスト" }
    email                 { "test@test.com" }
    password              { "test1234" }
    password_confirmation { "test1234" }
    last_name             { "山田" }
    first_name            { "太郎" }
    kana_last_name        { "ヤマダ" }
    kana_first_name       { "タロウ" }
    birthday              { Date.new(2000, 01, 01) }
  end
end
