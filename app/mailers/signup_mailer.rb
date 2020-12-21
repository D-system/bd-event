class SignupMailer < ApplicationMailer
  default to: Rails.application.config.x.new_signup_notification_email

  def new_signup_notification(event, email)
    @email = email
    @event_name = event.name
    mail(subject: I18n.t('new_signup_notification', event_name: event.name))
  end
end
