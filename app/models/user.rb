class User < ActiveRecord::Base
  has_many :reservations
  has_many :sessions

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
