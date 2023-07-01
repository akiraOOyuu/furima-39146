FactoryBot.define do
  factory :pay_deli do
      postcode        {"123-4567"}
      prefecture_id   {5}
       city           {"横浜"}
       block          {"1-1"}
       building       {"ビル"}
       phone_number   {"0901234678"}
       item_id        {2}
       user_id        {2}
      token {"tok_abcdefghijk00000000000000000"}
  end
end
