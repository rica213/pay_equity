FactoryBot.define do
  sequence :email do |n|
    "user#{n}@email.me"
  end

  factory :user do
    email { generate(:email) }
    password { "123456789" }
    gender { "Female" }
    job_title { "Software Engineer" }
    years_of_experience { 3 }
    location { "Mars" }
    industry { "Tech" }
  end
end
