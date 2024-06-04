class AddInformationToUserModel < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :mobile_number, :string
    add_column :users, :address, :string
    add_column :users, :gender, :string
    add_column :users, :sexuality, :string
    add_column :users, :admin, :boolean
  end
end
