FactoryBot.define do
  factory :comment do
    commenter { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
  end
end
