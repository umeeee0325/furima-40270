FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example.com'}
    password              {'aaa123'}
    password_confirmation {password}
    last_name             {'テスト'}
    first_name            {'太郎'}
    last_name_kana        {'テスト'}
    first_name_kana       {'タロウ'}
    birth                 {'2000-01-01'}
  end
end