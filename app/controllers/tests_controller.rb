class TestsController < ApplicationController

  before_action :set_test, only: %i[start]

  def index
    @tests = Test.all.select { |test| test.is_ready == true }
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  def recall
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
