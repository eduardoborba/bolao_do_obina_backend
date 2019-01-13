class AddStatusIdToBetLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :bet_leagues, :status_id, :integer
  end
end
