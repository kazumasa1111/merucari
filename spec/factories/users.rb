FactoryBot.define do

  factory :user do
    nickname              {"ヒカキン"}
    email                 {"hikakintv@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    first_name            {"武蔵"}
    last_name             {'宮本'}
    first_name_kana       {"ムサシ"}
    last_name_kana        {"ミヤモト"}
    birthday              {"2020/12/25"}
    tel                   {"00000000000"}
  end

end