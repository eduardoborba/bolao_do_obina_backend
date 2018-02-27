class CreateBetLeagues < ActiveRecord::Migration[5.1]
  def change
    create_table :bet_leagues do |t|
      t.string :name

      t.timestamps
    end
  end
end
