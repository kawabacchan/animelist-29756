FactoryBot.define do
  factory :anime do
    name { Faker::Name.first_name }
    genre_id { Faker::Number.between(from: 2, to: 9) }
    score { Faker::Number.between(from: 0, to: 100) }
    memo { Faker::Lorem.sentence }
    association :list
  end
end
