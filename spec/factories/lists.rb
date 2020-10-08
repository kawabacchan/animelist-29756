FactoryBot.define do
  factory :list do
    name {Faker::Name.name}
    public_id {Faker::Number.between(from: 2, to: 3)}
    association :user
  end
end
