module QuestionsHelper
  def question_header(action)
    if action == 'new'
      "Create New #{@question.test.title} Question"
    elsif action == 'edit'
      "Edit #{@question.test.title} Question"
    end
  end
end
