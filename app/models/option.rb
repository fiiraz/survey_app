class Option < ApplicationRecord
  belongs_to :question
  has_many :responses
  validates :title, length: { maximum: 40 }, presence: true
end
