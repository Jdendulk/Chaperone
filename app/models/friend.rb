class Friend < ApplicationRecord
  belongs_to :user_primary
  belongs_to :user_secondary
  has_many :friends_sessions
end
