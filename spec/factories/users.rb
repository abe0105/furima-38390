FactoryBot.define do

  factory :user do
    nickname              { "テスト" }
    email                 { Faker::Internet.free_email }
    password              { "test1234" }
    password_confirmation { "test1234" }
    last_name             { "田中" }
    first_name            { "二郎" }
    kana_last_name        { "タナカ" }
    kana_first_name       { "ジロウ" }
    birthday              { Date.new(2000, 01, 01) }
  end
end
