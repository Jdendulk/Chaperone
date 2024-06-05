class Meeting < ApplicationRecord
  belongs_to :user
  has_many :friend_meetings
end
