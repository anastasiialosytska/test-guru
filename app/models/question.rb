class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :check_quantity_of_answers

  private

  def check_quantity_of_answers
    errors.add(:base, 'quantity of answers shoukd be from 1 to 4') if
      self.answers.count > 4 && self.answers.count < 1
  end
end
