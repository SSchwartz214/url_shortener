FactoryBot.define do
  factory :url do
    original { 'https://www.google.com/' }
    short { Faker::Internet.slug }
  end
end
