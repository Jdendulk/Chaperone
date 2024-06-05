class Friend < ApplicationRecord
  belongs_to :user_primary, class_name: "User"
  belongs_to :user_secondary, class_name: "User"
  has_many :friend_meetings, dependent: :destroy
end
