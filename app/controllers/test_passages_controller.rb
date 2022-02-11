class TestPassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result gist]

  rescue_from Octokit::UnprocessableEntity, with: :unprocessable_entity

  def show
  end

  def result
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    @link = result.html_url
    redirect_to @test_passage, success: t('.success', html_url: view_context.link_to(t('.link'), @link, class: 'alert-link', target: :blank))
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def unprocessable_entity
    flash[:alert] = t('.failure')
  end
end
