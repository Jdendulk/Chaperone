class CreateFriends < ActiveRecord::Migration[7.1]
  def change
    create_table :friends do |t|
      t.references :user_primary, null: false, foreign_key: true
      t.references :user_secondary, null: false, foreign_key: true

      t.timestamps
    end
  end
end
