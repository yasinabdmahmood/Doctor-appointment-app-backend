class Reservation < ApplicationRecord
  belongs_to :doctor
  belongs_to :account

  validates :date, presence: true
  validates :city, presence: true
end
