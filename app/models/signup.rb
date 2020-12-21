class Signup < ApplicationRecord
  belongs_to :event

  validates :email, email: true

  after_create :notify_signup

  private

  def notify_signup
    SignupMailer.new_signup_notification(event, email).deliver
  end
end
