class User < ApplicationRecord
  require 'securerandom'
  has_secure_password
  has_many :reservations, dependent: :destroy
  has_one :admin

  validates :email, presence: true
  validates :password, presence: true
  validates :username, presence: true, uniqueness: true
end
