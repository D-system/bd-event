class Event < ApplicationRecord
  has_many :signups

  validates :uid, uniqueness: true
  validates :uid, :name, :start_datetime, :end_datetime, presence: true
end
