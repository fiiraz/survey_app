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
class Question < ApplicationRecord
  has_many :options
  has_many :responses
  belongs_to :survey

  enum question_type: %i[text choice], _default: :text

  validates :title, length: { maximum: 280 }, presence: true
  validates :question_type, presence: true

  def text?
    question_type == "text"
  end

  def option?
    question_type == "option"
  end
end
