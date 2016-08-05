class CreateEventsGamesJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_table :events_games, id: false do |t|
      t.integer :event_id
      t.integer :game_id
    end

    #add_index :events_games, event_id
    #add_index :events_games, game_id
  end
end
