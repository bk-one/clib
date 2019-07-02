FactoryBot.define do
  factory :series do
    name { 'Rocket Raccoon' }
    limited { false }
    description { Faker::Markdown.sandwich(6, 3) }
  end
end