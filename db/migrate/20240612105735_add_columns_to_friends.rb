class AddColumnsToFriends < ActiveRecord::Migration[7.1]
  def change
    add_column :friends, :image_url, :string
    add_column :friends, :phone, :string
  end
end
