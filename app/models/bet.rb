class Bet < ApplicationRecord
  belongs_to :game
  belongs_to :player
  belongs_to :bet_league

  validates :player_id, :bet_league_id, :game_id, :home_bet, :visitor_bet, presence: true
end
