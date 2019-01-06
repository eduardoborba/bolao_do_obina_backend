class Player < ApplicationRecord
  has_many :player_bet_leagues
  has_many :bets
end
