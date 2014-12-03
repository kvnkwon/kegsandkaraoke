class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :session

  validates :song_name, presence: true
  validates :url, presence: true
end
