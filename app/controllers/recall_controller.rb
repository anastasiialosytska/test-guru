class RecallController < ApplicationController
  def new
  end

  def create
    @recall = params[:message]
    RecallMailer.send_feedback(@recall).deliver_now
    redirect_to root_path
  end
end
