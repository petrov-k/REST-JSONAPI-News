FactoryBot.define do
  factory :article do
    sequence(:title) { |n| "Sample Article #{n}" }
    content { "This is a sample article." }
    user
  end
end
