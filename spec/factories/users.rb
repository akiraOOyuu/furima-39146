FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'abc123'}
    password_confirmation {password}
    first_name            {"田中"}
    last_name             {"裕二"}
    first_name_reading    {"タナカ"}
    last_name_reading     {"ユウジ"}
    birth_date            {Faker::Date.birthday}
  end
end