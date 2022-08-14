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
