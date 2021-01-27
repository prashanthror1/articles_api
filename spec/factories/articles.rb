FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(min_alpha: 10) }
    body { Faker::Lorem.paragraph }
  end
end
