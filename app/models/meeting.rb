class Meeting < ApplicationRecord
  belongs_to :user
  has_many :friend_meetings
  has_many :friends, through: :friend_meetings
  has_many :messages
  has_many :locations

  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :start_time, presence: true
  validates :date, presence: true
end
