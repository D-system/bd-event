class Signup < ApplicationRecord
  belongs_to :event

  validates :email, email: true
end
