class QuestionSerializer < ActiveModel::Serializer
  belongs_to :survey
  has_many :options

  attributes :id, :title, :question_type
end
