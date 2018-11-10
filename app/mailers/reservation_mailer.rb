class ReservationMailer < ApplicationMailer
  def send_email_to_guest(user, activity)
    @recipient = user
    @activity = activity
    mail(to: @recipient.email, subject: 'Your reservation is confirmed!')
  end
end
