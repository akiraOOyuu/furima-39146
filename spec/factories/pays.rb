FactoryBot.define do
  factory :pay do
    price {3000}
     user_id {1}
     item_id {1}
     id {1}

     association :user, factory: :user
     association :item, factory: :item
  end
end
