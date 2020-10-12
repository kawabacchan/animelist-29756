FactoryBot.define do
  factory :user do
    nickname {Faker::Name.first_name}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday {Faker::Date.between(from: '1920-01-01', to: Date.today)}
    sex_id {Faker::Number.between(from: 2, to: 4)}
  end
end
