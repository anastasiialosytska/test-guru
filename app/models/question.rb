class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_one :gist

  validates :body, presence: true

  after_destroy :after_destroy_unpublished_test

  private

  def after_destroy_unpublished_test
    self.test.update(is_ready: false) if self.test.questions_count < 1
  end
end
