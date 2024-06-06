class FriendMeeting < ApplicationRecord
  belongs_to :friend
  belongs_to :meeting

  validates :friend, uniqueness: { scope: :meeting }
end
