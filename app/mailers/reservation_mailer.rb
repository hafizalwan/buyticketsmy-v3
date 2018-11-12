class ReservationMailer < ApplicationMailer
  def send_email_to_guest(guest, activity)
    @recipient = guest
    @activity = activity
    mail(to: @recipient.email, subject: 'Your reservation is confirmed!')
  end
end
