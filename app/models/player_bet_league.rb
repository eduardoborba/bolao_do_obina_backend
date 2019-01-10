class PlayerBetLeague < ApplicationRecord
  belongs_to :player
  belongs_to :bet_league

  validates :player_id, :bet_league_id, presence: true
end
