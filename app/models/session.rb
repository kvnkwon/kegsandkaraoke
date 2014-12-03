class Session < ActiveRecord::Base
  belongs_to :user
  has_many :reservations

  validates :name, presence: true, uniqueness: true
end
