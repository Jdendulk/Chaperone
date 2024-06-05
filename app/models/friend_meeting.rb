class FriendMeeting < ApplicationRecord
  belongs_to :friend
  belongs_to :meeting
end
