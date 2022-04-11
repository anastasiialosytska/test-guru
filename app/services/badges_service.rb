class BadgesService
  def initialize(test_passage)
    @test_passage = test_passage
    @current_user = @test_passage.user
  end

  def call
    Badge.first
  end

  def all_tests_first_level
    Test.where(level: 1)
  end
end
