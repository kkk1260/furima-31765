FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password              {password}
    password_confirmation {password}
    first_name            {"山田"}
    first_kata            {"ヤマダ"}
    last_name             {"太郎"}
    last_kata             {"タロウ"}
    birthday              {"2000-01-01"}
  end
end