# == Schema Information
#
# Table name: surveys
#
#  id         :uuid             not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_surveys_on_name  (name) UNIQUE
#
class Survey < ApplicationRecord
  has_many :questions
  has_many :feedbacks

  validates :name, length: { maximum: 120 }, presence: true
end
