class AddShareCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :share_code, :string
  end
end
