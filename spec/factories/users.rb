FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test_#{n}@mail.com" }
    password { "secret" }
    password_confirmation { "secret" }
  end
end
