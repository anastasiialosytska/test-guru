class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :author, class: 'User', foreign_key: author_id

  def self.tests_by_category(category_title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: category_title}).
    order('tests.title DESC').pluck(:title)
  end
end


