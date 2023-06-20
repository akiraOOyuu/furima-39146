FactoryBot.define do
  factory :item do
    image              { Rack::Test::UploadedFile.new('app/assets/images/melon.png', 'image/png')}
    title              {  Faker::Lorem.sentence }
    category_id         {2}
    content             {Faker::Lorem.paragraph }
    status_id           {2}
    postage_id          {2}
    prefecture_id       {2}
    deli_day_id         {2}
    price               {1000}
    association :user, factory: :user
  end
end
