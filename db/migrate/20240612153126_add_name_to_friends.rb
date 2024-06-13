class AddNameToFriends < ActiveRecord::Migration[7.1]
  def change
    add_column :friends, :name, :string
  end
end
