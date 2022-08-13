FactoryBot.define do
  factory :option do
    association :question, factory: :question
    title { "test option" }
  end
end
