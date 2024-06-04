class FriendSession < ApplicationRecord
  belongs_to :friends
  belongs_to :sessions
end
