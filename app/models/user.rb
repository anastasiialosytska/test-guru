class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :owned_tests, class_name: 'Test', foreign_key: :author_id

  validates :first_name, :last_name, :email, presence: true

  def passed_tests(test_level)
    Test.joins(:tests_users).where(level: test_level).where(tests_users: { user_id: id })
  end
end
