class AddBetLeagueIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :bet_league_id, :integer
  end
end
