class FriendSession < ApplicationRecord
  belongs_to :friend
  belongs_to :session
end
