class CreateRounds < ActiveRecord::Migration[5.1]
  def change
    create_table :rounds do |t|
      t.integer :bet_league_id
      t.integer :number_of_games
      t.datetime :blocked_after
      t.integer :round_number
      t.integer :status_id

      t.timestamps
    end
  end
end
