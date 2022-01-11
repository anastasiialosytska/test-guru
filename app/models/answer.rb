class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validate :check_quantity_of_answers, on: :create

  private

  def check_quantity_of_answers
    errors.add(:base, 'quantity of answers should be from 1 to 4') if
      Answer.where(question_id: question_id).count >= 4
  end
end
