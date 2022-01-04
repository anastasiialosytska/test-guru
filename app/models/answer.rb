class Answer < ApplicationRecord
  belongs_to :question

  scope :only_correct, -> { where(correct: true) }
end
