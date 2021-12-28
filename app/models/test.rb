class Test < ApplicationRecord
  def self.tests_by_category(category_title)
    Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where(categories: {title: category_title}).
    order('tests.title DESC').pluck(:title)
  end
end


