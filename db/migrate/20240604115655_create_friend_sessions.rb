class CreateFriendSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :friend_sessions do |t|

      t.timestamps
    end
  end
end
