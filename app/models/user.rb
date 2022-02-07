class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :owned_tests, class_name: 'Test', foreign_key: :author_id

  # validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  # validates :password, presence: true, if: Proc.new { |u| u.password_digest.blank? }
  # validates :password, confirmation: true

  def passed_tests(test_level)
    Test.joins(:tests_users).where(level: test_level).where(tests_users: { user_id: id })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end
end
