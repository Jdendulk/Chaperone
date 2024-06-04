class CreateFriendSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :friend_sessions do |t|
      t.references :friend, null: false, foreign_key: true
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
