# == Schema Information
#
# Table name: responses
#
#  id          :uuid             not null, primary key
#  body        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  feedback_id :uuid             not null
#  option_id   :uuid
#  question_id :uuid             not null
#
# Indexes
#
#  index_responses_on_feedback_id  (feedback_id)
#  index_responses_on_option_id    (option_id)
#  index_responses_on_question_id  (question_id)
#
# Foreign Keys
#
#  fk_rails_...  (feedback_id => feedbacks.id)
#  fk_rails_...  (option_id => options.id)
#  fk_rails_...  (question_id => questions.id)
#
class Response < ApplicationRecord
  belongs_to :option, optional: true
  belongs_to :question
  belongs_to :feedback

  validates :body, length: { maximum: 280 }
  validates :body, presence: true, if: :text_question_type
  validates :option, presence: true, if: :choice_question_type

  def text_question_type
    question&.text?
  end

  def choice_question_type
    question&.choice?
  end
end
