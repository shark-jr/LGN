class AddIdToGamesUser < ActiveRecord::Migration[5.0]
  def change
    add_column :games_users, :id, :primary_key, first: true
  end
end
