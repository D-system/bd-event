FactoryBot.define do
  factory :event do
    sequence(:uid) { |n| "uid#{n}" }
    sequence(:name) { |n| "name#{n}" }
    sequence(:location) { |n| "location#{n}" }
    start_datetime { 10.minutes.ago }
    end_datetime { 2.hours.from_now }
  end
end
