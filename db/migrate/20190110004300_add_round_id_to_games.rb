class AddRoundIdToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :round_id, :integer
  end
end
