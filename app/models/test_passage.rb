class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question

  PERCENT_OF_CORRECT_ANSWERS = 85.0.freeze

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    current_question.nil?
  end

  def test_result
    if correct_questions.zero?
      0
    else
      (correct_questions.to_f / self.test.questions_count) * 100
    end
  end

  def success?
    test_result >= PERCENT_OF_CORRECT_ANSWERS
  end

  def current_question_number
    self.test.questions.where('id <= ?', self.current_question.id).count
  end

  def progress
    if current_question_number == 1
      0
    else
      ((current_question_number - 1) / self.test.questions_count.to_f) * 100
    end
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first
  end
end

