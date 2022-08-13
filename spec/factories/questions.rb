FactoryBot.define do
  factory :question do
    association :survey, factory: :survey
    title { "test question" }
    question_type { "text" }
  end
end
