# == Schema Information
#
# Table name: surveys
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_surveys_on_name  (name) UNIQUE
#
class SurveySerializer < ActiveModel::Serializer
  has_many :questions, serializer: QuestionSerializer
  has_many :feedbacks

  attributes :id, :name
end
