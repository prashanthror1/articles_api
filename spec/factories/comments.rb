FactoryBot.define do
  factory :commentor do
    commenter { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
  end
end
