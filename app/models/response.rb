class Response < ApplicationRecord
  belongs_to :option, optional: true
  belongs_to :question
  belongs_to :feedback

  validates :body, length: { maximum: 280 }
end
