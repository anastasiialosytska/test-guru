class RecallMailer < ApplicationMailer
  def send_feedback(message)
    @message = message

    mail to: 'alosytska@gmail.com'
  end
end
