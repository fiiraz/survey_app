# == Schema Information
#
# Table name: questions
#
#  id            :uuid             not null, primary key
#  question_type :integer
#  title         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  survey_id     :uuid             not null
#
# Indexes
#
#  index_questions_on_survey_id  (survey_id)
#
# Foreign Keys
#
#  fk_rails_...  (survey_id => surveys.id)
#
class QuestionSerializer < ActiveModel::Serializer
  belongs_to :survey
  has_many :options

  attributes :id, :title, :question_type
end
