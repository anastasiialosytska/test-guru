class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :owned_tests, class_name: 'Test', foreign_key: :author_id

  validates :first_name, :last_name, :email, presence: true

  def passed_tests(test_level)
    Test.joins(:tests_users).where(level: test_level).where(tests_users: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
