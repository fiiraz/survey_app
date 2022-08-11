class Option < ApplicationRecord
  belongs_to :question
  validates :title, length: { maximum: 40 }, presence: true
end
