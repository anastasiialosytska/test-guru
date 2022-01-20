module AnswersHelper
  def answer_header(answer)
    if @answer.new_record?
      "New answer"
    else
      "Edit answer"
    end
  end
end
