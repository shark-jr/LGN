class AddIndexToGames < ActiveRecord::Migration[5.0]
  def change
     add_index :games, :title
  end
end
