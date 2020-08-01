FactoryBot.define do

  factory :product do
    name                          {"item"}
    description_of_item           {"descriptionです"}
    commodity_condition           {"新品・未使用"}
    shipping_charges              {"着払い（購入者負担）"}
    days_until_shipping           {"1~2日で発送"}
    price                         {"1000"} 
    prefecture_id                 {"10"} 
    category_id                   {"10"}
    brand_id                      {"10"}
    
    association :brand
    association :category
  end

end