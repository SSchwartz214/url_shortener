FactoryBot.define do
  factory :url do
    original { Faker::Internet.url }
    random_id { Faker::Internet.slug }
  end
end
