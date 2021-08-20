FactoryBot.define do
  factory :user do
    name             {'test'}
    email            {'test@example'}
    password         {'a00000'}
    password_confirmation     {'a00000'}
    first_name       {'テスト'}
    last_name        {'てす'}
    furigana_fn      {'テスト'}
    furigana_ln      {'テスト'}
    birthday         {'1990-01-01'}
  end
end