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
      send("#{badge.rule}") && (badge.parameter == test.level.to_s || badge.parameter == test.category.title || badge.parameter == 'first_try')
    end
  end
  
  def level
    (Test.where(level: test.level).ids - successfuly_test_passages.pluck(:test_id)).empty?
  end

  def category
    (Test.tests_by_category(test.category.title).ids - successfuly_test_passages.pluck(:test_id)).empty?
  end

  def first_try
    test_passage.success? && all_test_passages.where(test_id: test.id).count == 1
  end
end
