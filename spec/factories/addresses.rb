FactoryBot.define do

  factory :address do
    # user_id               {1}
    ship_family_name      {"佐々木"}
    ship_first_name       {"望"}
    ship_family_name_kana {"ササキ"}
    ship_first_name_kana  {"ノゾミ"}
    postal_code           {"123-4567"}
    prefecture_id         {1}
    municipality          {"墨田区"}
    block_number          {"1-1-1"}
    apartment_name        {"渡部兼101"}
    phone_number          {"09012345687"}
  end

end