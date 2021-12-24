class Test < ApplicationRecord
  def self.tests_by_category(category_title)
    test_category_id = Category.find_by(title: category_title).id
    Test.where(category_id: test_category_id).order('title DESC').pluck(:title)
  end
end
