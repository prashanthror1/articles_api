FactoryBot.define do
  factory :article do
    title { Faker::Lorem.characters(min_alpha: 10) }
    body { Faker::Lorem.paragraph }


  trait :with_search_term do
  	title { "Sample Article Number 1" }
    body { "Test body for the article Article 1" }
  end
  factory :article_with_search, traits: [:with_search_term]
end
end
