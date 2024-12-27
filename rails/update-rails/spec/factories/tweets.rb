# spec/factories/tweets.rb
FactoryBot.define do
  factory :tweet do
    content { Faker::Lorem.sentence(word_count: 10) }
    created_at { Faker::Time.backward(days: 7) }
    updated_at { Faker::Time.backward(days: 1) }
    association :user
  end
end
