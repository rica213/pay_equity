FactoryBot.define do
  factory :salary do
    salary { 50000 }
    benefits { 10000 }
    association :user, factory: :user
  end
end
