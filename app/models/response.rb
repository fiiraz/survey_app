class Response < ApplicationRecord
  belongs_to :survey
  has_many :options, through: :questions, optional: true
  has_many :questions, through: :survey
  has_many :feedbacks, through: :survey

  validates :body, length: { maximum: 140 }
end