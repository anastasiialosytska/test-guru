class Admin::QuestionsController < ApplicationController

  before_action :find_test
  before_action :find_question, only: %i[show destroy edit]

  # rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = @test.questions
  end

  def show 
  end

  def new
    @question = @test.questions.new
  end

  def edit
  end

  def create
    @question = @test.questions.new(question_params)

    if @question.save
      redirect_to [:admin, @question]
    else
      render plain: @question.errors.messages
    end
  end

  def update
    find_question

    if @question.update(question_params)
      redirect_to [:admin, @question]
    else
      render :edit
    end
  end

  def destroy
    @question.destroy

    redirect_to [:admin, @test]
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    test_id = Question.find_by(id: params[:id])&.test_id
    @test = Test.find(test_id || params[:test_id])
  end

  def find_question
    @question = @test.questions.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question not exist'
  end
end
