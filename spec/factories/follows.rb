FactoryBot.define do
  factory :follow do
    friend_id {Faker::Number.number}
    association :user
  end
end
