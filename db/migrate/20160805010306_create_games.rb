class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.string :game_url
      t.string :image

      t.timestamps
    end
  end
end
