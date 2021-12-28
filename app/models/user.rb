class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :owned_tests, class: 'Test'

  def passed_tests(test_level)
    Test.joins(:tests_users).where(level: test_level).where(tests_users: { user_id: id })
  end
end
