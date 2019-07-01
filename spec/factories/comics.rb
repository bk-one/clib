FactoryBot.define do
  factory :comic do
    title { 'Rocket Raccoon' }
    pages { 36 }
    cover_price { 3.99 }
    currency { 'USD' }

    sequence(:upc) { |n| 100_000_000_000 + n }
    sequence(:issue)

    association :series
  end
end
