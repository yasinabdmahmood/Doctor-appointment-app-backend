class Doctor < ApplicationRecord
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :picture, presence: true
  validates :speciality, presence: true
  validates :bio, presence: true
end
