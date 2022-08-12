class Survey < ApplicationRecord
  has_many :questions
  has_many :feedbacks

  validates :name, length: { maximum: 120 }, presence: true
end
