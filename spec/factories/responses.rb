FactoryBot.define do
  factory :response do
    association :question, factory: :question
    association :feedback, factory: :feedback
    association :option, factory: :option, optional: true
    body { "test response" }
  end
end
