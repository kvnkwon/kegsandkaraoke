class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :session

  validates :name, presence: true
  validates :url, presence: true
end
