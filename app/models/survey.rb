class Survey < ApplicationRecord
  has_many :questions

  validates :name, length: { maximum: 120 }, presence: true
end
