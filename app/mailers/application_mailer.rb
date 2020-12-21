class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.config.x.default_from_address
  layout 'mailer'
end
