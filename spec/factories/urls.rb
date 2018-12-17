FactoryBot.define do
  factory :url do
    original { Faker::Internet.url }
    short { Faker::Internet.slug }
  end
end
