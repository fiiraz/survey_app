class Question < ApplicationRecord
  has_many :options
  has_many :responses
  belongs_to :survey

  enum question_type: %i[text choice], _default: :text

  validates :title, length: { maximum: 280 }, presence: true
  validates :question_type, presence: true
end
