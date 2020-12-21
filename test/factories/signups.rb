FactoryBot.define do
  factory :signup do
    event
    sequence(:email) { |n| "email#{n}@example.com" }
  end
end
