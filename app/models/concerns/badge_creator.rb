module BadgeCreator
  def add_badge(badge)
    self.user.badges << badge
  end
  
  def check_achievements(test)
    @all_test_passages = self.user.test_passages
    @successfuly_test_passages = self.user.test_passages.where(success: true)

    level_achievement(test.level)
    categoty_achievement(test.category)
    first_try_achievement
  end

  def level_achievement(level)
    add_badge(Badge.find_by(rule: 'level', parameter: level.to_s)) if level_rule_followed?
  end

  def categoty_achievement(category)
    add_badge(Badge.find_by(rule: 'category', parameter: category.title)) if category_rule_followed?
  end

  def first_try_achievement
    add_badge(Badge.find_by(rule: 'first_try')) if first_try_rule_followed?
  end

  def level_rule_followed?
    (Test.where(level: test.level).ids - @successfuly_test_passages.pluck(:test_id)).empty?
  end

  def category_rule_followed?
    (Test.where(category: test.category).ids - @successfuly_test_passages.pluck(:test_id)).empty?
  end

  def first_try_rule_followed?
    @successfuly_test_passages.where(test_id: test.id).count == 1 && @all_test_passages.where(test_id: test.id).count == 1
  end
end
