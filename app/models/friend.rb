class Friend < ApplicationRecord
  belongs_to :user
  has_many :friend_meetings, dependent: :destroy
end
