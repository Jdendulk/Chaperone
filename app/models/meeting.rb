class Meeting < ApplicationRecord
  belongs_to :user
  has_many :friend_meetings
  has_many :messages

  has_many :locations
end
