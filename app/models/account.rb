class Account < ApplicationRecord
  require 'securerandom'
  has_secure_password
  has_many :reservations, dependent: :destroy
  has_one :admin
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
end
