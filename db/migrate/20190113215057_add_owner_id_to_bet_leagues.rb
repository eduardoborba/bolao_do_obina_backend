class AddOwnerIdToBetLeagues < ActiveRecord::Migration[5.1]
  def change
    add_column :bet_leagues, :owner_id, :integer
  end
end
