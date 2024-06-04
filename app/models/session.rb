class Session < ApplicationRecord
  belongs_to :user
  has_many :friends_sessions
end
