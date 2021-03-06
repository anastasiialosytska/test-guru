class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :difficult, -> { where('level >=5 ') }
  scope :ready, -> { where(is_ready: true) }
  scope :tests_by_category, -> (category_title) { joins("INNER JOIN categories ON tests.category_id = categories.id").
    where(categories: { title: category_title}) }

  

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :ready_to_publish, on: %i[create update], if: :is_ready

  def self.sort_tests_by_category(category_title)
    self.tests_by_category(category_title).order('tests.title DESC').pluck(:title)
  end

  def questions_count
    self.questions.count
  end

  private

  def ready_to_publish
    errors.add(:base, 'test cannot be published without questions') if
      self.questions_count < 1
  end
end
