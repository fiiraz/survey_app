class SurveySerializer < ActiveModel::Serializer
  has_many :questions, serializer: QuestionSerializer
  has_many :feedbacks

  attributes :id, :name
end