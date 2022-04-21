class BadgeService

  attr_reader :test_passage, :test, :current_user, :all_test_passages, :successfuly_test_passages

  def initialize(test_passage)
    @test_passage = test_passage
    @test = @test_passage.test
    @current_user = @test_passage.user
    @all_test_passages = @test_passage.user.test_passages
    @successfuly_test_passages = @all_test_passages.where(success: true)
  end

  def call
    Badge.all.select do |badge|
      badge if send("#{badge.rule}", badge.parameter)
    end
  end
  
  def level(param)
    return false if param != test.level.to_s
    (Test.where(level: test.level).ids - successfuly_test_passages.pluck(:test_id)).empty?
  end

  def category(param)
    return false if param != test.category.title
    (Test.tests_by_category(test.category.title).ids - successfuly_test_passages.pluck(:test_id)).empty?
  end

  def first_try(param)
    return false if param != 'first_try'
    test_passage.success? && all_test_passages.where(test_id: test.id).count == 1
  end
end
