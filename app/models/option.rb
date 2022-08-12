class Option < ApplicationRecord
  belongs_to :question
  has_many :response
  validates :title, length: { maximum: 40 }, presence: true
end
