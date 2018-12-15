FactoryBot.define do
  factory :url do
    original { Faker::Internet.email }
    random_id { Faker::Internet.slug }
  end
end
