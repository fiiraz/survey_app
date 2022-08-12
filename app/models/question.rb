class Question < ApplicationRecord
  has_many :options
  has_many :response
  belongs_to :survey

  validates :title, length: { maximum: 280 }, presence: true
  enum question_type: %i[text choice], _default: :text
end
