class Question < ApplicationRecord
  has_many :options
  belongs_to :survey

  validates :title, length: { maximum: 120 }, presence: true
end
