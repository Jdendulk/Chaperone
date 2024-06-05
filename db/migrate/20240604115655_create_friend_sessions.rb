class CreateFriendSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :friend_meetings do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
