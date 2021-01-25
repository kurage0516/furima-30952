FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name }
    email                 {Faker::Internet.free_email}
    password              { '1a' +Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    name                  {"遼太郎"}
    name_ruby             {"リョウタロウ"}
    surname               {"土居"}
    surname_ruby          {"ドイ"}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end