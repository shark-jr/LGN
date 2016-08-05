class AddFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :dob, :date
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :integer
    add_column :users, :country, :string
    add_column :users, :bio, :text
    add_column :users, :fb, :string
    add_column :users, :steam, :string
    add_column :users, :psn, :string
    add_column :users, :xbox, :string
    add_column :users, :twitch, :string
  end
end
