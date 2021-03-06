class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result
    if @test_passage.success?
      @test_passage.update_column(:success, true)
      result = BadgeService.new(@test_passage).call
      current_user.badges << result
      flash.now[:success] = 'Поздравляем, вы получили награду' if result.any?
    end
  end

  def update
    if params[:answer_ids]&.any? || @test_passage.time_over?
      @test_passage.accept!(params[:answer_ids])
    else
      flash.now[:alert] = t('.error')
    end

    if @test_passage.completed? || @test_passage.time_over?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
      flash[:alert] = 'Время для прохождения теста вышло, тест не пройден' if @test_passage.time_over?
    else
      render :show
    end
  end

  def gist
    service = GistQuestionService.new(@test_passage.current_question)
    result = service.call

    flash_options = if service.success?
      { success: t('.success', html_url: view_context.link_to(t('.link'), result.html_url, class: 'alert-link', target: :blank)) }
    else
      { alert: t('.failure') }
    end

    redirect_to @test_passage, flash_options
                
    current_user.gists.create(question: @test_passage.current_question, github_id: result.id)
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
